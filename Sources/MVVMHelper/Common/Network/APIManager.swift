//
//  File.swift
//  
//
//  Created by Leyter on 09.08.2023.
//

import Foundation
import Alamofire

protocol IAPIManager {
    func request<M: Decodable>() async throws -> M
    func request<M: Decodable, B: Encodable>(body: B) async throws -> M
}

class APIManager {
    private let session: Session
    
    init(configuration: URLSessionConfiguration, interceptor: RequestInterceptor, logger: EventMonitor?) {
        self.session = Session(configuration: configuration, interceptor: interceptor)
    }
}

extension APIManager: IAPIManager {
    func request<M>() async throws -> M where M : Decodable {
        <#code#>
    }
    
    func request<M, B>(body: B) async throws -> M where M : Decodable, B : Encodable {
        <#code#>
    }
}
