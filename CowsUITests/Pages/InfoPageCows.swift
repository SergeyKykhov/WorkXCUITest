//
//  MainPageCows.swift
//  CowsUITests
//
//  Created by Sergey Kykhov on 03.11.2023.
//

import XCTest

class InfoPageCows: PageProtocol {

    var app = XCUIApplication()

    // MARK: - UI elements

    private enum IdentifierInfoCows: String {
        case buttonOne = "id: кнопка узнать больше"
        case textField = "id:bTextField Имя коровы"
        case buttonTwo = "id: 1"
        case imageCow = "id: изображение корова"
        case headingCow = "id: заголовок корова"
        case descriptionCow = "id: описание коровы"
    }

    private lazy var buttonInfoTabBar: XCUIElement = {
        app.tabBars.children(matching: .button).element(boundBy: 0)
    }()

    private lazy var buttonTableCowTabBar: XCUIElement = {
        app.tabBars.children(matching: .button).element(boundBy: 1)
    }()

    // MARK: - Actions

    @discardableResult
    func swipeUpScreen() -> Self {
        app.swipeUp()
        return self
    }

    @discardableResult
    func tapTextField(enterText: String) -> Self {
        let text = app.textFields[IdentifierInfoCows.textField.rawValue]
        text.tap()
        text.typeText(enterText)
        return self
    }

    @discardableResult
    func tapButtonOne() -> Self {
        app.buttons[IdentifierInfoCows.buttonOne.rawValue].tap()
        print("кнопка нажалась")
        return self
    }

    @discardableResult
    func tapButtonTwo() -> Self {
        app.buttons[IdentifierInfoCows.buttonTwo.rawValue].tap()
        return self
    }

    // MARK: - Verification

    @discardableResult
    func existsAssertButtonOne() -> Self {
        XCTAssert(app.buttons[IdentifierInfoCows.buttonOne.rawValue].exists)

        if !app.buttons[IdentifierInfoCows.buttonOne.rawValue].isHittable {
            swipeUpScreen()
            XCTAssert(app.buttons[IdentifierInfoCows.buttonOne.rawValue].isHittable)
        }
        return self
    }

    // MARK: - Expectation

    @discardableResult
    func waitButtonTwoAppear() -> Self {
        let elementButon = app.buttons[IdentifierInfoCows.buttonTwo.rawValue]
        let predicat = NSPredicate(format: "exists == true")
        let exp = XCTNSPredicateExpectation(predicate: predicat, object: elementButon)
        let result = XCTWaiter().wait(for: [exp], timeout: 5)
        if result == .completed {
            tapButtonTwo()
        } else {
            tapTextField(enterText: "Серая корова")
            tapButtonOne()
        }
        return self
    }
} // Finish class
