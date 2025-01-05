package com.studyorganizermain.entity;

import jakarta.persistence.*;
import lombok.Data;

import java.time.LocalDateTime;

@Entity
@Data
public class Event {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String location;

    private LocalDateTime startTime;
    private LocalDateTime endTime;

    @ManyToOne
    private User user;
}