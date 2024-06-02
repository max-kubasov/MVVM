//
//  MainViewModelTest.swift
//  MVVMTests
//
//  Created by Max on 02.06.2024.
//

import XCTest
@testable import MVVM

class MainViewModelTests: XCTestCase {
    
    var mainViewModel: MainViewModel!
    
    override func setUp() {
        super.setUp()
        mainViewModel = MainViewModel()
    }
    
    override func tearDown() {
        mainViewModel = nil
        super.tearDown()
    }
    
    func testNumberOfSections() {
        XCTAssertEqual(mainViewModel.numberOfSection(), 1, "Number of sections should be 1")
    }
    
    func testNumberOfRows() {
        XCTAssertEqual(mainViewModel.numberOfRows(0), 0, "Number of rows should be 0 initially")
    }
    
    func testGetUsers() {
        // Set isLoading to true
        mainViewModel.isLoading.value = true
        
        // Create XCTestExpectation
        let expectation = self.expectation(description: "Data fetch expectation")

        // Call getUsers
        mainViewModel.getUsers()

        // Check isLoading is true after calling getUsers
        XCTAssertTrue(mainViewModel.isLoading.value ?? false, "isLoading should be true after calling getUsers()")
        
        // Fulfill the expectation after data fetch
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            // Assuming successful data fetch
            let users: [Users] = [Users(username: "John", email: "john@example.com"), Users(username: "Jane", email: "jane@example.com")]
            self.mainViewModel.dataSource = users
            self.mainViewModel.mapCellData()
            
            // Check isLoading is false after data fetch
            XCTAssertFalse(self.mainViewModel.isLoading.value ?? true, "isLoading should be false after data fetch")
            XCTAssertEqual(self.mainViewModel.cellDataSource.value?.count, 2, "Cell data source should contain 2 items")
            
            // Fulfill the expectation
            expectation.fulfill()
        }

        // Wait for expectation
        waitForExpectations(timeout: 5, handler: nil)
    }


}

