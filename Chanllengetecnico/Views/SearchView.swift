//
//  SearchView.swift
//  Chanllengetecnico
//
//  Created by Gerardo Enrique Mendez Raigoso on 4/08/24.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        HStack {
            TextField("Buscar productos...", text: $viewModel.searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                viewModel.searchProducts()
            }) {
                Text("Buscar")
            }
        }
        .padding()
    }
}
