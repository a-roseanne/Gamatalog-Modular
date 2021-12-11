//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 11/12/21.
//
import Combine
 
public protocol LocaleDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?) -> AnyPublisher<[Response], Error>
    func add(entities: [Response]) -> AnyPublisher<Bool, Error>
    func get(id: String) -> AnyPublisher<Response, Error>
    func update(id: Int, entity: Response) -> AnyPublisher<Bool, Error>
}
