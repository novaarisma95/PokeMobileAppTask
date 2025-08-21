//
//  RegistrationInteractor.swift
//  PokeMobileAppTask
//
//  Created by Nova Arisma on 8/17/25.
//

import Foundation
import UIKit

class RegistrationInteractor: PresenterToInteractorRegisProtocol {
    weak var presenter: (any InteractorToPresenterRegisProtocol)?
    
    func regis(username: String, fullname: String, email: String, password: String) {
        let user = UserRegistration(username: username, fullname: fullname, email: email, password: password)
        presenter?.regisSucceeded(user: user)
    }
    
    
}
