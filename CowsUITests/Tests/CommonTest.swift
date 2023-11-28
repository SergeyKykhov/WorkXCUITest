//
//  CommonTest.swift
//  CowsUITests
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import XCTest

class CommonTest: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["testing"]
        app.launch()
    }

    override func tearDown() {
        app.terminate()
    }
}
