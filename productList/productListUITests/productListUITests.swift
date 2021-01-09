//
//  productListUITests.swift
//  productListUITests
//
//  Created by Ivo Dutra on 31/12/20.
//

import XCTest
@testable import productList

class ProductListUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        app.launch()
    }
    
    /*
     
     Breakpoint inside a test func and then go to the debuuger and type:
     
     "po app"
     
     The entire element subtree will be printed out.
     
     */
    
    func testLabelExists() {
        XCTAssert(app.staticTexts["Skol"].exists)
    }
    
    func testTaps() {
        app.tables["tableView"].cells.element.firstMatch.tap()
        app.tables["tableView"].cells["Colorado Ribeirão"].firstMatch.tap()
    }

}
