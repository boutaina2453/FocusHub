package com.studyorganizermain.dto;

import com.studyorganizermain.enums.TaskStatus;
import lombok.Data;
import java.time.LocalDate;

@Data
public class TaskDTO {
    private Long id;
    private String title;
    private String description;
    private TaskStatus status;
    private LocalDate dueDate;
    private Long userId;  // ID de l'utilisateur associé à la tâche
}
