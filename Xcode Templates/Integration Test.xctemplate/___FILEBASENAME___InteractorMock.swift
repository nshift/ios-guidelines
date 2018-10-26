//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//___COPYRIGHT___
//

import Foundation

class ___FILEBASENAMEASIDENTIFIER___: ___VARIABLE_productName:identifier___InteractorInput
{
    // MARK: - Variables
    
    private var stateCase: StateCase
    weak var output: ___VARIABLE_productName:identifier___InteractorOutput?
    
    // MARK: - init
    
    init(stateCase: StateCase) {
        self.stateCase = stateCase
    }
    
    // Here you can implement you interactor methods and set up output or other methods depending on your sate case :
    //
    //    func getMethod() {
    //        switch stateCase {
    //        case .success :
    //            scenario_02_success()
    //        case default:
    //            scenario_01_error()
    //        }
    //    }
    
    // MARK: - SCENARIOS
    
    // Here you can implement you interactor mock methods to call for outputs you want to check for specific scenarios :
    //
    //    private func scenario_01_error() {
    //        output?.showSuccess()
    //    }
    //
    //    private func scenario_02_success() {
    //        output?.showError()
    //    }
}

/// This code is here to manage state case for different scenarios
/// It should be moved to some other file
public enum StateCase
{
    case success
    case error
}

public class StateCaseManager
{
    public static let shared = StateCaseManager()
    public var stateCase: StateCase = .success
}
