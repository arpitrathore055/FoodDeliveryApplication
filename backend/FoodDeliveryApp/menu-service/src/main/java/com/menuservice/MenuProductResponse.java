package com.menuservice;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MenuProductResponse {

    private int total_size;
    private int type_id;
    private int offset;
    private List<MenuProductDetail> products;

}
