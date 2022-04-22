//
//  CachedImage.swift
//  RickAndMorty
//
//  Created by Сергей Веретенников on 21/04/2022.
//

import UIKit

class CachedImage: UIImageView {
    
    
    func fetchImage(from string: String) {
        
        image = UIImage(named: "noImage")
        
        guard let url = URL(string: string) else {
            image = UIImage(named: "noImage")
            image?.withTintColor(.gray)
            return
        }
        
        
        //Using cached image
        if let cachedImage = getCachedImage(from: url) {
            image = cachedImage
            return
        }
        
        //Loading image and caching
        NetworkManager.shared.fetchImage(from: url) { data, response in
            
            self.image = UIImage(data: data)
            self.saveDataToCache(with: data, and: response)
            
        }
        
        
    }
    private func saveDataToCache(with data: Data, and response: URLResponse) {
        guard let url = response.url else { return }
        
        let request = URLRequest(url: url)
        let cachedUrl = CachedURLResponse(response: response, data: data)
        
        URLCache.shared.storeCachedResponse(cachedUrl, for: request)
    }
    
    private func getCachedImage(from: URL) -> UIImage? {
        
        let request = URLRequest(url: from)
        if let cachedResponce = URLCache.shared.cachedResponse(for: request) {
            return UIImage(data: cachedResponce.data)
        }
        
        return nil
    }
}
