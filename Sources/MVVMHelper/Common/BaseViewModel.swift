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

open class BaseViewModel: ObservableObject {
    @Published public var state: State = .none
    
    public init() {}
    
    open func didViewLoad() async {}
}

extension BaseViewModel {
    public enum State {
        case none
        case loading(Bool)
        case error(Error)
    }
}
#endif
