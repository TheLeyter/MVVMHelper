//
//  File.swift
//  
//
//  Created by Leyter on 07.08.2023.
//

#if canImport(UIKit)
import UIKit

open class BaseView: UIView {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func setup() {
        setupConstraints()
    }
    
    open func setupConstraints() {
        
    }
}

//MARK: for test
public class TestView: BaseView {
    public let button: UIButton = UIButton(type: .system)
}
#endif
