//
//  APICaller.swift
//  Movietranding
//
//  Created by Abdulbosid Jalilov on 10/08/23.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
}

public class APICaller {
    
    static func getTrandingMovies(
        completionHandler: @escaping (_ result: Result<TrendingMouvieModel,NetworkError>) -> Void) {
            
            let urlString = NetworkConstant.shared.severAddress +
            "trending/all/day?api_key=" +
            NetworkConstant.shared.apiKey
            
            guard let url = URL(string: urlString) else {
                completionHandler(.failure(.urlError))
                return
            }
            
            URLSession.shared.dataTask(with: url) { dataResponse, urlResponse, error in
                
                if error == nil,
                   let data = dataResponse,
                   let resultData = try? JSONDecoder().decode(TrendingMouvieModel.self, from: data) {
                    completionHandler(.success(resultData))
                }
                
                else {
                    completionHandler(.failure(.canNotParseData))
                }
                
            }.resume()
            
        }
    
    
}
