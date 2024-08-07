//
//  ProductDetailView.swift
//  Chanllengetecnico
//
//  Created by Gerardo Enrique Mendez Raigoso on 4/08/24.
//

import Foundation
import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.thumbnail))
                .frame(width: 100, height: 100)
            Text(product.title)
                .font(.largeTitle)
                .padding()
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Detalle del Producto", displayMode: .inline)
    }
}
