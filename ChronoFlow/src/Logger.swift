import Foundation
import os.log

class Logger {
    static let shared = Logger()
    private let log: OSLog

    private init() {
        log = OSLog(subsystem: "com.chronoflow", category: "general")
    }

    func log(_ message: String, level: OSLogType = .default) {
        os_log("%{public}@", log: log, type: level, message)
    }

    func logError(_ message: String) {
        log(message, level: .error)
    }

    func logInfo(_ message: String) {
        log(message, level: .info)
    }

    func logDebug(_ message: String) {
        log(message, level: .debug)
    }
}
