package com.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
@AllArgsConstructor
public class Employee {
    private int id;
    private String name;
    private String surname;
    private String email;
    private Company company;
}
