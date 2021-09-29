//
//  PodcastsSearchController.swift
//  Podcasts
//
//  Created by Ilya Kalibrov on 9/17/21.
//

import UIKit
import Alamofire

class PocastsSearchController: UITableViewController, UISearchBarDelegate {
    
    let podcasts = [
        Podcast(name: "Podcast One", artistName: "test"),
        Podcast(name: "Podcast Two", artistName: "test")
        
    ]
    
    let cellId = "cellId"
    
    // UISearchController implementation
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchBar()
        setupTableView()
    }
    
    // 1. register a cell for our tableView
    fileprivate func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        //searchController.dimsBackgroundDuringPresentation = false
        
        searchController.searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        
        // TODO: implement Alamofire to search iTunes API
        let url = "https://yahoo.com"
        AF.request(url).response { (dataResponse) in
            if let error = dataResponse.error {
                print("Could not get a response", error)
                return
            }
            
            guard let data = dataResponse.data else { return }
            let dummyString = String(data: data, encoding: .utf8)
            print(dummyString ?? "")
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        let podcast = self.podcasts[indexPath.row]
        cell.textLabel?.text = "\(podcast.name)\n\(podcast.artistName)"
        cell.textLabel?.numberOfLines = -1
        cell.imageView?.image = UIImage(named: "appicon")
        
        return cell
    }
}
