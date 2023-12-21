//
//  File.swift
//  
//
//  Created by Leyter on 07.08.2023.
//

#if canImport(UIKit)

import UIKit
import Combine

open class BaseViewController<V:BaseView, VM:BaseViewModel>: UIViewController {
    public let mainView: V
    public let viewModel: VM
    
    public var subscriptions: Set<AnyCancellable> = []
    
    public init(viewModel: VM) {
        self.mainView = V()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = mainView
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        Task {
            await initViewController()
            bindUI()
            await viewModel.didViewLoad()
        }
    }
    
    open func initViewController() async {}
    
    open func bindUI() {}
}
#endif


enum BaseUrl {
    case prod
    case dev
}

