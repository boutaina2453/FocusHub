package com.studyorganizermain.dto;

import lombok.Data;
import java.util.List;

@Data
public class UserDTO {
    private Long id;
    private String name;
    private String email;
    private List<GroupDTO> groups;   // Liste des groupes auxquels l'utilisateur appartient
    private List<EventDTO> events;   // Liste des événements associés à l'utilisateur
}
