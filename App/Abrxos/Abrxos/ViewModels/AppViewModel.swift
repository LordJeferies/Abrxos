import Foundation
import Combine

@MainActor
public class AppViewModel: ObservableObject {
    @Published public var brands: [Brand] = []
    @Published public var projects: [Project] = []
    @Published public var selectedBrandId: UUID? {
        didSet {
            if let id = selectedBrandId, !brands.contains(where: { $0.id == id }) {
                selectedBrandId = nil
            }
        }
    }
    @Published public var errorMessage: String?

    private let persistence: PersistenceServiceProtocol

    public init(persistence: PersistenceServiceProtocol = JSONPersistenceService()) {
        self.persistence = persistence
        loadData()
    }

    public var selectedBrand: Brand? {
        guard let id = selectedBrandId else { return nil }
        return brands.first(where: { $0.id == id })
    }

    public var filteredProjects: [Project] {
        guard let brandId = selectedBrandId else { return [] }
        return projects.filter { $0.brandId == brandId }
    }

    public func loadData() {
        errorMessage = nil
        do {
            self.brands = try persistence.loadBrands()
            self.projects = try persistence.loadProjects()
            if let id = selectedBrandId, !brands.contains(where: { $0.id == id }) {
                selectedBrandId = brands.first?.id
            } else if selectedBrandId == nil, let first = brands.first {
                selectedBrandId = first.id
            }
        } catch {
            errorMessage = "Error al cargar los datos guardados: \(error.localizedDescription)"
        }
    }

    public func addBrand(name: String) {
        errorMessage = nil
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            errorMessage = "El nombre de la marca no puede estar vacío."
            return
        }

        let newBrand = Brand(name: trimmed)
        var updatedBrands = brands
        updatedBrands.append(newBrand)

        do {
            try persistence.saveBrands(updatedBrands)
            self.brands = updatedBrands
            if selectedBrandId == nil {
                selectedBrandId = newBrand.id
            }
        } catch {
            errorMessage = "Error al guardar la marca: \(error.localizedDescription)"
        }
    }

    public func addProject(name: String, brandId: UUID) {
        errorMessage = nil
        let trimmed = name.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else {
            errorMessage = "El nombre del proyecto no puede estar vacío."
            return
        }
        guard brands.contains(where: { $0.id == brandId }) else {
            errorMessage = "La marca seleccionada no es válida."
            return
        }

        let newProject = Project(name: trimmed, brandId: brandId)
        var updatedProjects = projects
        updatedProjects.append(newProject)

        do {
            try persistence.saveProjects(updatedProjects)
            self.projects = updatedProjects
        } catch {
            errorMessage = "Error al guardar el proyecto: \(error.localizedDescription)"
        }
    }
}
