import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = AppViewModel()

    var body: some View {
        NavigationSplitView {
            BrandListView(viewModel: viewModel)
                .navigationSplitViewColumnWidth(min: 200, ideal: 250, max: 300)
        } detail: {
            ProjectListView(viewModel: viewModel)
        }
        .alert(item: Binding<AlertItem?>(
            get: { viewModel.errorMessage.map { AlertItem(message: $0) } },
            set: { _ in viewModel.errorMessage = nil }
        )) { item in
            Alert(
                title: Text("Aviso"),
                message: Text(item.message),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let message: String
}

#Preview {
    ContentView()
}
