//
//  File.swift
//  
//
//  Created by Angelica Roseanne on 11/12/21.
//

import Foundation

public enum URLError: LocalizedError {

  case invalidResponse
  case addressUnreachable(URL)
  
  var errorDescription: String? {
    switch self {
    case .invalidResponse:
        return "Sorry, invalid response"
    case .addressUnreachable(let url):
        return "\(url.absoluteString) is unreachable."
    }
  }
}

public enum DatabaseError: LocalizedError {

  case invalidInstance
  case requestFailed
  
  var errorDescription: String? {
    switch self {
    case .invalidInstance: return "Invalid Instance database"
    case .requestFailed: return "Sorry, failed request"
    }
  }

}
