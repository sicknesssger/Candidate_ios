//
//  ProductViewModelTests.swift
//  ChanllengetecnicoTests
//
//  Created by Gerardo Enrique Mendez Raigoso on 5/08/24.
//

import Foundation
import XCTest
import Combine
@testable import Chanllengetecnico

class ProductViewModelTests: XCTestCase {
    var viewModel: ProductViewModel!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        viewModel = ProductViewModel()
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }

    func testSearchProducts_Success() {
        let expectation = XCTestExpectation(description: "Products loaded")
        
        viewModel.searchText = "iphone"
        viewModel.$products.dropFirst().sink { products in
            if !products.isEmpty {
                expectation.fulfill()
            }
        }.store(in: &cancellables)
        
        viewModel.searchProducts()
        
        wait(for: [expectation], timeout: 5.0)
        XCTAssertFalse(viewModel.products.isEmpty)
    }

    func testSearchProducts_InvalidURL() {
        viewModel.searchText = ""
        viewModel.searchProducts()
        XCTAssertEqual(viewModel.errorMessage, "Invalid URL")
    }
}
