import Foundation

public protocol PersistenceServiceProtocol {
    func loadBrands() throws -> [Brand]
    func saveBrands(_ brands: [Brand]) throws
    func loadProjects() throws -> [Project]
    func saveProjects(_ projects: [Project]) throws
}

public class JSONPersistenceService: PersistenceServiceProtocol {
    private let fileManager: FileManager
    private let directoryURL: URL

    public init(fileManager: FileManager = .default, directoryURL: URL? = nil) {
        self.fileManager = fileManager
        if let directoryURL = directoryURL {
            self.directoryURL = directoryURL
        } else {
            let appSupport = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
            let abrxosURL = appSupport.appendingPathComponent("Abrxos", isDirectory: true)
            self.directoryURL = abrxosURL
        }
        createDirectoryIfNeeded()
    }

    private func createDirectoryIfNeeded() {
        if !fileManager.fileExists(atPath: directoryURL.path) {
            try? fileManager.createDirectory(at: directoryURL, withIntermediateDirectories: true, attributes: nil)
        }
    }

    private var brandsFileURL: URL {
        directoryURL.appendingPathComponent("brands.json")
    }

    private var projectsFileURL: URL {
        directoryURL.appendingPathComponent("projects.json")
    }

    public func loadBrands() throws -> [Brand] {
        guard fileManager.fileExists(atPath: brandsFileURL.path) else {
            return []
        }
        let data = try Data(contentsOf: brandsFileURL)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([Brand].self, from: data)
    }

    public func saveBrands(_ brands: [Brand]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(brands)
        try data.write(to: brandsFileURL, options: [.atomic])
    }

    public func loadProjects() throws -> [Project] {
        guard fileManager.fileExists(atPath: projectsFileURL.path) else {
            return []
        }
        let data = try Data(contentsOf: projectsFileURL)
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode([Project].self, from: data)
    }

    public func saveProjects(_ projects: [Project]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys]
        encoder.dateEncodingStrategy = .iso8601
        let data = try encoder.encode(projects)
        try data.write(to: projectsFileURL, options: [.atomic])
    }
}
