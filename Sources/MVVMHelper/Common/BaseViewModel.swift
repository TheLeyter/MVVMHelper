//
//  File.swift
//  
//
//  Created by Leyter on 07.08.2023.
//

import Foundation
#if canImport(UIKit)
import UIKit
import Combine

public class BaseViewModel: ObservableObject {
    @Published var state: State = .none
    
    func didViewLoad() async {}
}

extension BaseViewModel {
    enum State {
        case none
        case loading(Bool)
        case error(Error)
    }
}

//MARK: for test
public class TestViewModel: BaseViewModel {
    
}
#endif
