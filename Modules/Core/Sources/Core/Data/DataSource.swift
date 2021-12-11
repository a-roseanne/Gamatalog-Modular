//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 11/12/21.
//
import Combine
 
public protocol DataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
