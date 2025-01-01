import 'package:flutter/material.dart';
import '../providers/task_provider.dart';
import '../models/task.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatelessWidget {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Tasks',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 1.2,
          ),
        ),
        backgroundColor: Colors.indigo,
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          int totalTasks = taskProvider.tasks.length;
          int completedTasks = taskProvider.tasks
              .where((task) => task.isCompleted)
              .length;
          double completionRate =
              totalTasks > 0 ? completedTasks / totalTasks : 0.0;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Barre de progression
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Progress',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    LinearProgressIndicator(
                      value: completionRate,
                      backgroundColor: Colors.grey[300],
                      color: Colors.indigo,
                      minHeight: 10.0,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Completed: ${completedTasks}/${totalTasks} (${(completionRate * 100).toStringAsFixed(0)}%)',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
              // Ajouter une tâche
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _taskController,
                  decoration: InputDecoration(
                    labelText: 'Add a New Task',
                    hintText: 'Enter your task here',
                    prefixIcon: Icon(Icons.task_alt_outlined),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  onSubmitted: (value) {
                    if (value.isNotEmpty) {
                      taskProvider.addTask(Task(
                        id: DateTime.now().toString(),
                        title: value,
                      ));
                      _taskController.clear();
                    }
                  },
                ),
              ),
              // Liste des tâches
              Expanded(
                child: taskProvider.tasks.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.inbox_rounded,
                                size: 48.0, color: Colors.grey),
                            SizedBox(height: 16.0),
                            Text(
                              'No tasks available',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.grey,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              'Add a task to get started!',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: taskProvider.tasks.length,
                        itemBuilder: (context, index) {
                          final task = taskProvider.tasks[index];
                          return Card(
                            elevation: 4.0,
                            margin: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 8.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: task.isCompleted
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.orange.withOpacity(0.2),
                                child: Icon(
                                  task.isCompleted
                                      ? Icons.check_circle
                                      : Icons.radio_button_unchecked,
                                  color: task.isCompleted
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                              ),
                              title: Text(
                                task.title,
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  decoration: task.isCompleted
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              trailing: Wrap(
                                spacing: 8.0,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      task.isCompleted
                                          ? Icons.check_box
                                          : Icons.check_box_outline_blank,
                                      color: Colors.indigo,
                                    ),
                                    onPressed: () => taskProvider
                                        .toggleTaskCompletion(task.id),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete_outline,
                                        color: Colors.redAccent),
                                    onPressed: () =>
                                        taskProvider.deleteTask(task.id),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
