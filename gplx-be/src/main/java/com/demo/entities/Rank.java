package com.demo.entities;

import jakarta.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Rank {

    @Id
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column
    private String description;
}
