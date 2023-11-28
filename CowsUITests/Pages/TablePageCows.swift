//
//  TablePageCows.swift
//  CowsUITests
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import XCTest

class TablePageCows: PageProtocol {
    
    var app = XCUIApplication()

    // MARK: - UI elements

    private enum ElementViewTableCows: String {
        case list = "id: List"
        case image = "id: Image"
        case alert = "Нажал кнопку"
        case alertButtons = "Согласен"
    }

    private lazy var infoCowsTabBar: XCUIElement = {
        app.tabBars.children(matching: .button).element(boundBy: 0)
    }()

    private lazy var tableCowsTabBar: XCUIElement = {
        app.tabBars.children(matching: .button).element(boundBy: 1)
    }()

    // MARK: - Actions

    @discardableResult
    func tapButtoninfoCows() -> Self {
        infoCowsTabBar.tap()
       return self
    }

    @discardableResult
    func tapButtonTableCows() -> Self {
        tableCowsTabBar.tap()
        return self
    }

    @discardableResult
    func tapImage(label: Int) -> Self {
        let labelString = String(label)
        let collectionView = app.collectionViews[ElementViewTableCows.list.rawValue]
        var cell = collectionView.cells.containing(.staticText, identifier: labelString).element

        if !cell.isHittable {
            collectionView.swipeUp()
            cell = collectionView.cells.containing(.staticText, identifier: labelString).element
        }

        let image = cell.images[ElementViewTableCows.image.rawValue]

        if image.isHittable {
            image.tap()
        } else {
            XCTFail("Image not found in cell with label: \(labelString)")
        }
        return self
    }

    @discardableResult
    func tapButtonAllert() -> Self {
        app.alerts[ElementViewTableCows.alert.rawValue].buttons[ElementViewTableCows.alertButtons.rawValue].tap()
        return self
    }


    // MARK: - Verification

    @discardableResult
    func existsAssertViewTableCows() -> Self {
        XCTAssert(app.collectionViews[ElementViewTableCows.list.rawValue].exists)
        return self
    }

    @discardableResult
    func existsAssertAlert() -> Self {
        XCTAssertTrue(app.alerts[ElementViewTableCows.alert.rawValue].exists)
        return self
    }
}// Finish class
