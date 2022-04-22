//
//  R&MModel.swift
//  RickAndMorty
//
//  Created by Сергей Веретенников on 18/04/2022.
//

import Foundation

struct Welcome: Codable {
    let characters, locations, episodes: String
    
    init(value: [String: Any]) {
        
        
        characters = value["characters"] as! String
        locations = value["locations"] as! String
        episodes = value["episodes"] as! String
        
    }
}


//MARK: Characters
struct Chars: Codable {
    let info: Info?
    let results: [Character]
    
    init() {
        info = Info()
        results = []
    }
}


struct Info: Codable {
    
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
    
    var key: String {
        guard let prev = prev else {
            return ".key"
        }
        
        return prev + ".key"
    }
    
    init(value: [String: Any]) {
        count = value["count"] as! Int
        pages = value["pages"] as! Int
        next = value["next"] as! String
        prev = value["prev"] as? String
    }
    
    init() {
        count = 0
        pages = 0
        next = "NO"
        prev = "NO"
    }
    
}


struct Character: Codable {
    
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    
    let origin: OriginOfChar
    let location: LocationOfChar
    
    let image: String
    let episode: [String]
    
    let url: String
    let created: String
    
    init(value: [String: Any]) {
        id = value["id"] as! Int
        name = value["name"] as! String
        status = value["status"] as! String
        species = value["species"] as! String
        type = value["type"] as! String
        gender = value["gender"] as! String
        
        let originDict = value["origin"] as! [String: Any]
        origin = OriginOfChar(value: originDict)
        
        let locationDict = value["location"] as! [String: Any]
        
        location = LocationOfChar(value: locationDict)
        image = value["image"] as! String
        episode = value["episode"] as! [String]
        url = value["url"] as! String
        created = value["creaated"] as! String
        
    }
    
}

struct OriginOfChar: Codable {
    let name: String
    let url: String
    
    init(value: [String: Any]) {
        name = value["name"] as! String
        url = value["url"] as! String
    }
}

struct LocationOfChar: Codable {
    
    let name: String
    let url: String
    
    init(value: [String: Any]) {
        name = value["name"] as! String
        url = value["url"] as! String
    }
    
}


//MARK: Episodes
struct Episode: Codable {
    
    let id: Int
    let name: String
    let airDate: String
    let episode: String
    
    let character: [String]
    
    let url: String
    let created: String
    
    init(value: [String: Any]) {
        id = value["id"] as! Int
        name = value["name"] as! String
        airDate = value["air_date"] as! String
        episode = value["episode"] as! String
        character = value["character"] as! [String]
        url = value["url"] as! String
        created = value["created"] as! String
        
    }
}


//MARK: Location

struct Locations {
    
    let info: Info
    let results: Location
    
    init(value: [String: Any]) {
        
        let infoDict = value["info"] as! [String: Any]
        info = Info(value: infoDict)
        
        let resultDict = value["results"] as! [String: Any]
        results = Location(value: resultDict)
        
    }
}

struct Location: Codable {
    
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
    let url: String
    let created: String
    
    init(value: [String: Any]) {
        id = value[""] as! Int
        name = value["name"] as! String
        type = value["type"] as! String
        dimension = value["dimension"] as! String
        residents = value["residents"] as! [String]
        url = value["url"] as! String
        created = value["created"] as! String
    }
    
}
