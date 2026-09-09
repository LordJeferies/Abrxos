import Foundation

public struct Project: Identifiable, Codable, Equatable {
    public let id: UUID
    public var name: String
    public var brandId: UUID
    public var createdAt: Date
    public var updatedAt: Date

    public init(id: UUID = UUID(), name: String, brandId: UUID, createdAt: Date = Date(), updatedAt: Date = Date()) {
        self.id = id
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        self.brandId = brandId
        self.createdAt = createdAt
        self.updatedAt = updatedAt
    }

    public var isValid: Bool {
        !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
