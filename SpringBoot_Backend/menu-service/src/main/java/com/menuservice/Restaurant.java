package com.menuservice;

import jakarta.persistence.Column;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Restaurant {

    private Integer id;
    private String name;
    private String address;
    private String phoneNumber;

}
