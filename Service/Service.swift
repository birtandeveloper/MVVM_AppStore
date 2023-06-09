//
//  Service.swift
//  MVVM_AppStore
//
//  Created by Mac Os X on 24.01.2023.
//

import UIKit
import Alamofire

class Service {
    
    static let shared = Service()
    
    func fetchGenericJsonData<T: Codable>(urlString: String, completion: @escaping(T?, Error?) -> Void) {
        guard let urlString = URL(string: urlString) else {return}
        AF.request(urlString, method: .get).response {response in
            if let data = response.data {
                do{
                    let result = try JSONDecoder().decode(T.self,from: data)
                    completion(result, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
    }
}
