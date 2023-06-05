//
//  ServiceManager.swift
//  TravelApp
//
//  Created by engin gülek on 5.06.2023.
//

import Foundation

protocol ServiceManagerProtocol {
    func fetch<M:Codable>(target:Network,completion:@escaping(Result<[M]?,Error>)->())

}




final class ServiceManager : ServiceManagerProtocol {
    func fetch<M>(target: Network, completion: @escaping (Result<[M]?, Error>) -> ()) where M : Decodable, M : Encodable {
        
        
        let method = target.method.rawValue
        _ = target.headers ?? [:]
        let url = URL(string: "\(target.baseUrl)\(target.path)")!
        var request = URLRequest(url: url)
        request.httpMethod = method       
        URLSession.shared.dataTask(with: url) { data, res, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(DataResult<M>.self, from: data)
                    completion(.success(result.list))
                    
                }catch{
                    completion(.failure(error))
                }
                
            }
        }.resume()
        
     
        
    }
    
  
    
    
}
