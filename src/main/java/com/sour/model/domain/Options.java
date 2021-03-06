package com.sour.model.domain;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Objects;

/**
 * 选项实体类
 *
 * @author nndmw
 * @date 2021/09/04
 */
@Getter
@Setter
@ToString
@RequiredArgsConstructor
@Entity
@Table(name = "sour_options")
public class Options implements Serializable {

    private static final long serialVersionUID = 8076309455217575062L;

    /**
     * 设置项名称
     */
    @Id
    private String optionName;

    /**
     * 设置项的值
     */
    @Lob
    private String optionValue;

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Options options = (Options) o;
        return Objects.equals(optionName, options.optionName) && Objects.equals(optionValue, options.optionValue);
    }

    @Override
    public int hashCode() {
        return Objects.hash(optionName, optionValue);
    }
}
