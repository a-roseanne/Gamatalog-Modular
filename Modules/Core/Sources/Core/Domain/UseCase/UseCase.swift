//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 11/12/21.
//
import Combine
 
public protocol UseCase {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request?) -> AnyPublisher<Response, Error>
}
