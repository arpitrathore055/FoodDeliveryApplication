package com.menuservice;

import lombok.*;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class MenuProductDetail {

    private Integer id;
    private String name;
    private String description;
    private int price;
    private int stars;
    private String img;
    private String location;
    private Date created_at;
    private Date updated_at;
    private int type_id=2;

}
