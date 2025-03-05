import Foundation

class ProjectManager {
    var projects: [Project] = []

    struct Project: Identifiable {
        let id = UUID()
        var title: String
        var tasks: [TaskManager.Task] = []
        var color: String
    }

    func addProject(title: String, color: String) {
        let newProject = Project(title: title, color: color)
        projects.append(newProject)
    }

    func addTaskToProject(projectId: UUID, task: TaskManager.Task) {
        if let index = projects.firstIndex(where: { $0.id == projectId }) {
            projects[index].tasks.append(task)
        }
    }

    func getProjectsForDate(date: Date) -> [Project] {
        return projects.filter { project in
            project.tasks.contains { task in
                Calendar.current.isDate(task.dueDate, inSameDayAs: date)
            }
        }
    }
}
