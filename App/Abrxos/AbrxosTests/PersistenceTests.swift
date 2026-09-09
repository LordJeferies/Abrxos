import XCTest
@testable import Abrxos

final class PersistenceTests: XCTestCase {
    var tempDir: URL!
    var service: JSONPersistenceService!

    override func setUpWithError() throws {
        try super.setUpWithError()
        tempDir = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString, isDirectory: true)
        try FileManager.default.createDirectory(at: tempDir, withIntermediateDirectories: true)
        service = JSONPersistenceService(fileManager: .default, directoryURL: tempDir)
    }

    override func tearDownWithError() throws {
        try? FileManager.default.removeItem(at: tempDir)
        try super.tearDownWithError()
    }

    func testSaveAndLoadBrandsAndProjectsWithNewInstance() throws {
        let brandId = UUID()
        let brand = Brand(id: brandId, name: "Marca de Prueba")
        let projectId = UUID()
        let project = Project(id: projectId, name: "Proyecto 1", brandId: brandId)

        try service.saveBrands([brand])
        try service.saveProjects([project])

        let newService = JSONPersistenceService(fileManager: .default, directoryURL: tempDir)
        let loadedBrands = try newService.loadBrands()
        let loadedProjects = try newService.loadProjects()

        XCTAssertEqual(loadedBrands.count, 1)
        XCTAssertEqual(loadedBrands.first?.id, brandId)
        XCTAssertEqual(loadedBrands.first?.name, "Marca de Prueba")

        XCTAssertEqual(loadedProjects.count, 1)
        XCTAssertEqual(loadedProjects.first?.id, projectId)
        XCTAssertEqual(loadedProjects.first?.name, "Proyecto 1")
        XCTAssertEqual(loadedProjects.first?.brandId, brandId)
    }

    func testBrandAndProjectNameValidation() {
        let emptyBrand = Brand(name: "   ")
        XCTAssertFalse(emptyBrand.isValid)

        let validBrand = Brand(name: "  Abrxos Studio  ")
        XCTAssertEqual(validBrand.name, "Abrxos Studio")
        XCTAssertTrue(validBrand.isValid)

        let project = Project(name: "Podcast Ep 1", brandId: UUID())
        XCTAssertTrue(project.isValid)
    }

    func testCorruptedDataHandlingDoesNotCrash() throws {
        let brandsFileURL = tempDir.appendingPathComponent("brands.json")
        try "invalid json data".write(to: brandsFileURL, atomically: true, encoding: .utf8)

        XCTAssertThrowsError(try service.loadBrands()) { error in
            XCTAssertTrue(FileManager.default.fileExists(atPath: brandsFileURL.path))
        }
    }
}
