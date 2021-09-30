package com.sour.web.controller.admin;

import com.sour.model.domain.*;
import com.sour.model.dto.LogsRecord;
import com.sour.model.dto.SourConst;
import com.sour.service.CategoryService;
import com.sour.service.LogsService;
import com.sour.service.PostService;
import com.sour.service.TagService;
import com.sour.util.SourUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * 文章控制器
 *
 * @author nndmw
 * @date 2021/09/08
 */
@Controller
@RequestMapping(value = "/admin/posts")
@Slf4j
public class PostController {

    private final PostService postService;

    private final CategoryService categoryService;

    private final TagService tagService;

    private final LogsService logsService;

    private final HttpServletRequest request;

    @Autowired
    public PostController(PostService postService, CategoryService categoryService,
                          TagService tagService, LogsService logsService,
                          HttpServletRequest request) {
        this.postService = postService;
        this.categoryService = categoryService;
        this.tagService = tagService;
        this.logsService = logsService;
        this.request = request;
    }

    /**
     * 处理后台获取文章列表的请求
     *
     * @param model  模型
     * @param status 状态
     * @param page   页面
     * @param size   大小
     * @return {@link String}
     */
    @GetMapping
    public String posts(Model model,
                        @RequestParam(value = "status", defaultValue = "0") Integer status,
                        @RequestParam(value = "page", defaultValue = "0") Integer page,
                        @RequestParam(value = "size", defaultValue = "10") Integer size) {
        final Sort sort = Sort.by(Sort.Direction.DESC, "postId");
        final Pageable pageable = PageRequest.of(page, size, sort);
        final Page<Post> posts = postService.findPostByStatus(status, SourConst.POST_TYPE_POST, pageable);
        model.addAttribute("posts", posts);

        // 已发布
        model.addAttribute("publishCount", postService.findPostByStatus(0, SourConst.POST_TYPE_POST, pageable).getTotalElements());
        // 草稿
        model.addAttribute("draftCount", postService.findPostByStatus(1, SourConst.POST_TYPE_POST, pageable).getTotalElements());
        // 回收站
        model.addAttribute("trashCount", postService.findPostByStatus(2, SourConst.POST_TYPE_POST, pageable).getTotalElements());
        model.addAttribute("status", status);

        return "admin/admin_post";
    }


    /**
     * 处理跳转到新建文章页面
     *
     * @param model 模型
     * @return {@link String}
     */
    @GetMapping(value = "/new")
    public String newPost(Model model) {
        final List<Category> categories = categoryService.findAllCategories();
        final List<Tag> tags = tagService.findAllTags();
        model.addAttribute("categories", categories);
        model.addAttribute("tags", tags);
        return "admin/admin_post_md_editor";
    }

    /**
     * 添加文章
     *
     * @param post     文章
     * @param cateList 分类列表
     * @param tagList  标签列表
     * @param session  会话
     */
    @PostMapping(value = "/new/push")
    @ResponseBody
    public void pushPost(@ModelAttribute Post post,
                         @RequestParam("cateList") List<String> cateList,
                         @RequestParam("tagList") String tagList,
                         HttpSession session) {
        try {
            // 提取摘要
            int postSummary = 50;
            if (SourUtil.isNotNull(SourConst.OPTIONS.get("post_summary"))) {
                postSummary = Integer.parseInt(SourConst.OPTIONS.get("post_summary"));
            }
            if (SourUtil.htmlToText(post.getPostContent()).length() > postSummary) {
                final String summary = SourUtil.getSummary(post.getPostContent(), postSummary);
                post.setPostSummary(summary);
            }
            post.setPostDate(SourUtil.getDate());
            // 发表用户
            final User user = (User) session.getAttribute(SourConst.USER_SESSION_KEY);
            post.setUser(user);
            final List<Category> categories = categoryService.strListToCateList(cateList);
            post.setCategories(categories);
            if (StringUtils.isNoneEmpty(tagList)) {
                final List<Tag> tags = tagService.strListToTagList(StringUtils.trim(tagList));
                post.setTags(tags);
            }
            postService.saveByPost(post);
            log.info("已发表新文章：{}", post.getPostTitle());
            logsService.saveByLogs(
                    new Logs(LogsRecord.PUSH_POST, post.getPostTitle(), SourUtil.getIpAddr(request), SourUtil.getDate())
            );
        } catch (NumberFormatException e) {
            log.error("未知错误：{}", e.getMessage());
        }
    }
}
