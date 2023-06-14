//
//  JsonServiceManager.swift
//  TravelApp
//
//  Created by engin gülek on 14.06.2023.
//

import Foundation

protocol JsonServiceManagerProtocol {
    func fetchLocalJsonData(target:JsonData,completion:@escaping(Result<[CountryPhoneCode]?,Error>)->())
}

class JsonServiceManager : JsonServiceManagerProtocol {
    func fetchLocalJsonData(target:JsonData,completion: @escaping (Result<[CountryPhoneCode]?, Error>) -> ()) {
        let jsonData = readLocalJsonFile(forName: target.filePath)
        do {
            let resultData = try JSONDecoder().decode([CountryPhoneCode].self, from: jsonData!)
            print(resultData)
            completion(.success(resultData))
        }catch{
            completion(.failure(error))
        }
    }
    
    
  private  func readLocalJsonFile(forName name:String) -> Data? {
        
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
