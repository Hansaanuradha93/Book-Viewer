//
//  ViewController.swift
//  Book Viewer
//
//  Created by Hansa Anuradha on 1/25/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    // MARK: - Properties
    private var allBooks : [Book]?
    fileprivate let cellID = "CellID"
    
    
    // MARK: - ViewController methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register UITableView cell here
        tableView.register(BookCell.self, forCellReuseIdentifier: cellID)
        
        // Remove uneccessary tableview cells in footer
        tableView.tableFooterView = UIView()
        
        // Lets set nabigation item title here
        navigationItem.title = "Kindle"
        
        // Lets fetch some new books from the json here
        fetchBooks()
        
    }
    
    // MARK: - TableView Datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBooks?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BookCell
    
        // Lets get the book here
        guard let book = allBooks?[indexPath.row] else { return cell }
        
        // Add the data to the book cell
        cell.book = book
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Lets get the selected book here
        let selectedBook = allBooks?[indexPath.row]
        
        // Lets navigate to book page viewer which is a UICollectionViewController here
        let layout = UICollectionViewFlowLayout()
        let bookPageCotroller = BookPagerController(collectionViewLayout: layout)
        
        // Lets pass the selected book to bookPageController
        bookPageCotroller.book = selectedBook
        
        // Lets create a Navigation Controller here
        let navController = UINavigationController(rootViewController: bookPageCotroller)
        present(navController, animated: true, completion: nil)
    }
    
    
    // MARK: - Functions

    
    // Fetch Books from JSON here
    func fetchBooks() {
        print("Start Fetching books")
        
        guard let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            // There is an error
            if let unwrappedError = error {
                print("Error fetching books \(unwrappedError)")
                return
            }
            // No errors.. Good to go
            // Lets unwrap data
            guard let unwraptedData = data else { return }
            // Lets parse the JSON
            do {
                // Lets parse the JSON content
                let json = try JSONSerialization.jsonObject(with: unwraptedData, options: .mutableContainers)

                // Lets reate a book dictionary here
                guard let bookDictionaries = json as? [[String : Any]] else { return }
                
                // Lets initialize this array to a empty array instead of having a nil value
                self.allBooks = []
                
                for bookDictionary in bookDictionaries {

                    // Lets crate a book to store the book dictionary
                    let book = Book(dictionary: bookDictionary)
                    
                    // Lets append the books to allBooks
                    self.allBooks?.append(book)
                    
                }
                
                // Lets reload the tableview with newly added books in main thread instead in background thread here
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch let jsonError {
                
                print("Error Parsing JSON \(jsonError)")
            }
        }.resume()
    }
}

