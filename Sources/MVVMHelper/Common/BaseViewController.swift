//
//  File.swift
//  
//
//  Created by Leyter on 07.08.2023.
//

#if canImport(UIKit)

import UIKit
import Combine

public class BaseViewController<V:BaseView, VM:BaseViewModel>: UIViewController {
    public let mainView: V
    public let viewModel: VM
    
    public var subscriptions: Set<AnyCancellable> = []
    
    init(viewModel: VM) {
        self.mainView = V()
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available (*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        view = mainView
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        Task {
            bindUI()
            await initViewController()
            await viewModel.didViewLoad()
        }
    }
    
    public func initViewController() async {}
    
    public func bindUI() {}
}

//MARK: for test
public class TestViewController: BaseViewController<TestView, TestViewModel> {
    @UserDefaultsWrapper<String>(key: "adsad")
    var mane
    
    override init(viewModel: TestViewModel) {
        super.init(viewModel: viewModel)
    }
    
    override public func initViewController() async {
        //TODO: do somethink
    }
    
    override public func bindUI() {
        mainView.button.publisher(for: .touchUpInside).sink {
            print("touchUpInside")
        }.store(in: &subscriptions)
        
        viewModel.$state.sink { state in
            switch state {
            case .none:
                print("State -> none")
            case .loading(let isLoading):
                print("State -> loading: \(isLoading)")
            case .error(let err):
                print("State -> error: \(err.localizedDescription)")
            }
        }.store(in: &subscriptions)
    }
}

#endif


enum BaseUrl {
    case prod
    case dev
}

