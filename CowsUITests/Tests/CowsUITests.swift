//
//  CowsUITests.swift
//  CowsUITests
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import XCTest

final class CowsUITests: CommonTest {

    var infoPageCows = InfoPageCows()
    var tablePageCows = TablePageCows()

    override func setUp() {
        super.setUp()
    }

    func testButton() {
        infoPageCows
            .existsAssertButtonOne()
            .waitButtonTwoAppear()
    }

    func testTableCows() {
        tablePageCows
            .tapButtonTableCows()
            .existsAssertViewTableCows()
            .tapImage(label: 15)

            .existsAssertAlert()
            .tapButtonAllert()
    }

    override func tearDown() {
        super.tearDown()
    }
}
