//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

// For our testing we made the choice to use  [Quick](https://github.com/Quick/Quick) and [Nimble](https://github.com/Quick/Nimble).
// These tools allow us to work efficiently with the GIVEN / WHEN / THEN format.


import XCTest
import Quick
import Nimble

final class ___FILEBASENAMEASIDENTIFIER___: QuickSpec, ExtendedTesting
{
    // First describe should give us a context about the functionalities to test
    describe("As a user")
    
    /// A struct to give specific state and other static properties if needed to our scenarios
    struct TestCase {
        var stateCase: StateCase
    }
    
    public var viewController: ___VARIABLE_productName:identifier___ViewController?
    var storyboardName: String { return "Main" }
    
    /// instantiate all the necessary chain to run our tests
    /// - parameter testCase: A struct containing the state for a specific scenario
    private func setup(_ testCase: TestCase) {
        self.setupViewController()
        
        let interactor = ___VARIABLE_productName:identifier___InteractorMock(stateCase: testCase.stateCase)
        let presenter = ___VARIABLE_productName:identifier___Presenter(interactor: interactor)
        interactor.output = presenter
        presenter.view = self.viewController
        self.viewController?.presenter = presenter
        self.viewController?.presenter?.viewDidLoad()
    }
    
    override func spec() {
        // GIVEN should desribe our state, what we use as our `testCase`
        describe("GIVEN") {
            // WHEN should give us the interaction taking place. This would be what gives us informations about the actions to trigger
            context("WHEN") {
                beforeEach {
                    let testCase = TestCase(stateCase: .success)
                    self.setup(testCase)
                }
                // THEN gives us what to expect.
                it("THEN") {
                    //expect(self.viewController?.titleLabel?.text).toEventually(equal("Hello world!"))
                }
            }
        }
}


/// This extension is a helper to facilitate storyboard and view controllers manipulation.
/// It should be moved to a separate file

public protocol ExtendedTesting: class {
    
    associatedtype T: UIViewController
    
    var viewController: T? { get set }
    var storyboardName: String { get }
    
    func setupViewController()
}

public extension ExtendedTesting {
    public var storyboardName: String { return "Main" }
    
    public func setupViewController() {
        viewController = UIViewController.fromStoryboard(named: storyboardName, withIdentifier: String(describing: T.self), ofClass: T.self)
        viewController?.view.layoutSubviews()
    }
    
}
