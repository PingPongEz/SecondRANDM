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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = 110
        
        fetchCaracters(with: charactersLink)
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
        cell.setPics(from: character)
        
        return cell
    }
    
    @IBAction func nextPagePressed(_ sender: UIBarButtonItem) {
        
        guard let nextLink = rickAndMorty?.info?.next else { return }
        fetchCaracters(with: nextLink)
    }
    
    @IBAction func pervousPagePressed(_ sender: UIBarButtonItem) {
        
        guard let pervLink = rickAndMorty?.info?.prev else { return }
        fetchCaracters(with: pervLink)
        
    }
    
}

extension TableViewController {
    
    private func fetchCaracters(with link: String) {
        NetworkManager.shared.fetchChars(from: link) { result in
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
