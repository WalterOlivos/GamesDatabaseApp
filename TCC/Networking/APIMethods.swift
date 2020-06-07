//
//  APIMethods.swift
//  TCC
//
//  Created by Walter Oliveira on 06/06/20.
//  Copyright © 2020 Walter Oliveira. All rights reserved.
//

import Foundation

extension APIManager {
    
    struct APIMethods {
        
        static func load(url: URL, withCompletion completion: @escaping (Data?, Error?) -> Void) {
            
            let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
            
            let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
                completion(data, error)
            })
            task.resume()
        }
    
        static func loadGamesList(page: Int = 1, completion: @escaping ([GameModel]?, String?) -> Void) {
            var url = gamesListURL
            if page > 0 {
                url = URL(string: "\(gamesListURL)?page=\(page)")!
            }
            load(url: url) { data, error in
                guard let error = error else {
                    guard let data = data else {
                        completion(nil, defaultError)
                        return
                    }
                    do {
                        let result = try JSONDecoder().decode(ResultModel.self, from: data)
                        completion(result.games, nil)
                        return
                    } catch {
                        print(error.localizedDescription)
                        completion(nil, defaultError)
                        return
                    }
                }
                completion(nil, error.localizedDescription)
                return
            }
        }
    }
}
