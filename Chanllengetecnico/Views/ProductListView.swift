//
//  ProductListView.swift
//  Chanllengetecnico
//
//  Created by Gerardo Enrique Mendez Raigoso on 4/08/24.
//

import SwiftUI

struct ProductListView: View {
    @ObservedObject var viewModel: ProductViewModel
    
    var body: some View {
        List(viewModel.products) { product in
            NavigationLink(destination: ProductDetailView(product: product)) {
                HStack {
                    AsyncImage(url: URL(string: product.thumbnail))
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(product.title)
                            .font(.headline)
                        Text("$\(product.price, specifier: "%.2f")")
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}
