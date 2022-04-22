//
//  UserDefaults.swift
//  RickAndMorty
//
//  Created by Сергей Веретенников on 22/04/2022.
//

import Foundation

struct SaveChars {
    
    static func getChar(with key: String) -> Chars? {
        
        guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
        let character = try? JSONDecoder().decode(Chars.self, from: data)
        return character
        
    }
    
    static func getChar(with data: Data) -> Chars? {
        
        guard let character = try? JSONDecoder().decode(Chars.self, from: data) else { return nil }
        return character
        
    }
    
    static func saveChar(char: Chars) {
        
        let charData = try? JSONEncoder().encode(char)
        guard let key = char.info?.key else { return }
        UserDefaults.standard.set(charData, forKey: key)
        print("saved")
        
    }
    
}
