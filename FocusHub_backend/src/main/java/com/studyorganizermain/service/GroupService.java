package com.studyorganizermain.service;
import com.studyorganizermain.entity.Group;
import com.studyorganizermain.repository.GroupRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GroupService {
    private final GroupRepository groupRepository;

    public GroupService(GroupRepository groupRepository) {
        this.groupRepository = groupRepository;
    }

    public Group createGroup(Group group) {
        return groupRepository.save(group);
    }

    public List<Group> getAllGroups() {
        return groupRepository.findAll();
    }

    public Group getGroupById(Long id) {
        return groupRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Group not found with id: " + id));
    }

    public Group updateGroup(Long id, Group updatedGroup) {
        Group existingGroup = getGroupById(id);
        existingGroup.setName(updatedGroup.getName());
        existingGroup.setUsers(updatedGroup.getUsers());  // Optionnel : si vous modifiez aussi les utilisateurs
        return groupRepository.save(existingGroup);
    }

    public void deleteGroup(Long id) {
        Group group = getGroupById(id);
        groupRepository.delete(group);
    }
}
