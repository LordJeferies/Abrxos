import SwiftUI

struct ProjectListView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var showingAddProject = false
    @State private var newProjectName = ""

    var body: some View {
        VStack {
            if let brand = viewModel.selectedBrand {
                List {
                    Section(header: Text("Proyectos de \(brand.name)")) {
                        if viewModel.filteredProjects.isEmpty {
                            Text("No hay proyectos en esta marca.")
                                .foregroundColor(.secondary)
                                .italic()
                        } else {
                            ForEach(viewModel.filteredProjects) { project in
                                VStack(alignment: .leading, spacing: 4) {
                                    Text(project.name)
                                        .font(.headline)
                                    Text("Creado: \(project.createdAt, style: .date)")
                                        .font(.caption)
                                        .foregroundColor(.secondary)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .primaryAction) {
                        Button(action: { showingAddProject = true }) {
                            Label("Nuevo Proyecto", systemImage: "plus")
                        }
                    }
                }
            } else {
                VStack(spacing: 12) {
                    Image(systemName: "folder.badge.questionmark")
                        .font(.system(size: 48))
                        .foregroundColor(.secondary)
                    Text("Selecciona una marca para ver sus proyectos")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
        .sheet(isPresented: $showingAddProject) {
            VStack(spacing: 16) {
                Text("Crear Nuevo Proyecto")
                    .font(.headline)

                TextField("Nombre del proyecto", text: $newProjectName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 250)

                HStack {
                    Button("Cancelar") {
                        newProjectName = ""
                        showingAddProject = false
                    }
                    .keyboardShortcut(.cancelAction)

                    Button("Guardar") {
                        if let brandId = viewModel.selectedBrandId {
                            viewModel.addProject(name: newProjectName, brandId: brandId)
                        }
                        newProjectName = ""
                        showingAddProject = false
                    }
                    .keyboardShortcut(.defaultAction)
                    .disabled(newProjectName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .padding()
            .frame(width: 320, height: 180)
        }
    }
}
