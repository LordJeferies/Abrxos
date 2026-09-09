import SwiftUI

struct BrandListView: View {
    @ObservedObject var viewModel: AppViewModel
    @State private var showingAddBrand = false
    @State private var newBrandName = ""

    var body: some View {
        List(selection: $viewModel.selectedBrandId) {
            Section(header: Text("Marcas")) {
                if viewModel.brands.isEmpty {
                    Text("No hay marcas registradas.")
                        .foregroundColor(.secondary)
                        .italic()
                } else {
                    ForEach(viewModel.brands) { brand in
                        Text(brand.name)
                            .tag(brand.id)
                    }
                }
            }
        }
        .listStyle(SidebarListStyle())
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: { showingAddBrand = true }) {
                    Label("Nueva Marca", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showingAddBrand) {
            VStack(spacing: 16) {
                Text("Crear Nueva Marca")
                    .font(.headline)

                TextField("Nombre de la marca", text: $newBrandName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 250)

                HStack {
                    Button("Cancelar") {
                        newBrandName = ""
                        showingAddBrand = false
                    }
                    .keyboardShortcut(.cancelAction)

                    Button("Guardar") {
                        viewModel.addBrand(name: newBrandName)
                        newBrandName = ""
                        showingAddBrand = false
                    }
                    .keyboardShortcut(.defaultAction)
                    .disabled(newBrandName.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
            }
            .padding()
            .frame(width: 320, height: 180)
        }
    }
}
