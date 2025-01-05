package com.studyorganizermain.dto;

import lombok.Data;
import java.util.List;

@Data
public class GroupDTO {
    private Long id;
    private String name;
    private List<UserDTO> users;  // Liste des utilisateurs associés au groupe
}
