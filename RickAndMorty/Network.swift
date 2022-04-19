//
//  Network.swift
//  RickAndMorty
//
//  Created by Сергей Веретенников on 19/04/2022.
//

import Foundation

enum Errors: Error {
    case noUrl
    case noData
    case cantDecode
}

class NetworkManager {
    static var shared = NetworkManager()
    
    func fetchData(from string: String?, completion: @escaping(Result<Welcome, Errors>) -> Void) {
        guard let stringUrl = string else { completion(.failure(.noUrl)); return }
        guard let url = URL(string: stringUrl) else { completion(.failure(.noUrl)); return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            do {
                let data = try JSONDecoder().decode(Welcome.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                completion(.failure(.cantDecode))
            }
        }.resume()
    }
    
    func fetchChars(from string: String?, completion: @escaping(Result<Chars, Errors>) -> Void) {
        guard let stringUrl = string else { completion(.failure(.noUrl)); return }
        guard let url = URL(string: stringUrl) else { completion(.failure(.noUrl)); return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                print("decoding")
                let data = try JSONDecoder().decode(Chars.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch {
                print("no")
                completion(.failure(.cantDecode))
            }
        }.resume()
    }
    
    private init(){}
}
