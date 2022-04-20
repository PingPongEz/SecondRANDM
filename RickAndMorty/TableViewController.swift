//
//  TableViewController.swift
//  RickAndMorty
//
//  Created by Сергей Веретенников on 19/04/2022.
//

import UIKit

class TableViewController: UITableViewController {
    
    private var rickAndMorty: Chars?
    
    private var charactersLink = "https://rickandmortyapi.com/api/character"
    private var locationsLink: String?
    private var episodesLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 110
        
        print(charactersLink)
        fetchCaracters()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = rickAndMorty?.results.count else { return 0 }
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        guard let character = rickAndMorty?.results[indexPath.row] else { return cell }

        
        cell.setValuesForCell(from: character)
        
        
        return cell
    }

}

extension TableViewController {
    private func fetchLinks() {
        NetworkManager.shared.fetchData(from: "https://rickandmortyapi.com/api") { result in
            switch result {
            case .success(let allThings):
                print("asdasd")
                self.charactersLink = allThings.characters
                self.episodesLink = allThings.episodes
                self.locationsLink = allThings.locations
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func fetchCaracters() {
        NetworkManager.shared.fetchChars(from: charactersLink) { result in
            switch result {
            case .success(let chars):
                self.rickAndMorty = chars
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
