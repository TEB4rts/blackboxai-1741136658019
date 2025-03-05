import Foundation

class TaskManager {
    var tasks: [Task] = []

    struct Task: Identifiable {
        let id = UUID()
        var title: String
        var dueDate: Date
        var isCompleted: Bool = false
    }

    func addTask(title: String, dueDate: Date) {
        let newTask = Task(title: title, dueDate: dueDate)
        tasks.append(newTask)
    }

    func completeTask(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted = true
        }
    }

    func getTasksForDate(date: Date) -> [Task] {
        return tasks.filter { Calendar.current.isDate($0.dueDate, inSameDayAs: date) }
    }
}
