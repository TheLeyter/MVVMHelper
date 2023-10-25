//
//  File.swift
//  
//
//  Created by Leyter on 09.08.2023.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapper<Value> {
    let key: String
    var storage: UserDefaults = .standard

    var wrappedValue: Value? {
        get { storage.value(forKey: key) as? Value }
        set { storage.setValue(newValue, forKey: key) }
    }
}
