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
        createBooks()
        
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

        // Lets navigate to book page viewer which is a UICollectionViewController here
        let layout = UICollectionViewFlowLayout()
        let bookPageCotroller = BookPagerController(collectionViewLayout: layout)
        // Lets create a Navigation Controller here
        let navController = UINavigationController(rootViewController: bookPageCotroller)
        present(navController, animated: true, completion: nil)
    }
    
    
    // MARK: - Functions

    func createBooks() {
        
        let book1 = Book(title : "Harry Potter", author : "Hansa", image : UIImage(named: "bill")!, pages : [
            Page(text : "Page 1", number : 1),
            Page(text : "Page 2", number : 2)
            ])
        
        let book2 = Book(title: "Bill Gates", author: "Michal Begret", image : UIImage(named: "steve")!, pages: [
            Page(text : "text for page 1", number : 1),
            Page(text : "text for page 2", number : 2),
            Page(text : "text for page 3", number : 3),
            Page(text : "text for page 4", number : 4),
            ])
        
        allBooks = [book1, book2]
        
    }

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
            
            // Unwrap data
            guard let unwraptedData = data else { return }
            
            guard let dataAsString = String(data: unwraptedData, encoding: .utf8) else { return }
            
            print(dataAsString)
            
            
        }.resume()
        
        print("Have we fetched our books yet?")
        
    }

}

