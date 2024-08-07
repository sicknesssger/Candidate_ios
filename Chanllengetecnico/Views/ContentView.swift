//
//  ContentView.swift
//  Chanllengetecnico
//
//  Created by Gerardo Enrique Mendez Raigoso on 4/08/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ProductViewModel()
        var body: some View {
            NavigationView {
                VStack {
                    SearchView(viewModel: viewModel)
                    if viewModel.isLoading {
                        ProgressView()
                        
                    } else if let errorMessage = viewModel.errorMessage{
                        Text(errorMessage)
                            .foregroundColor(.red)
                    } else {
                        ProductListView(viewModel: viewModel)
                    }
                }
                .navigationTitle("Mercado Libre")
            }
        }
    }


#Preview {
    ContentView()
}
