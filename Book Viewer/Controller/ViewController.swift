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
        
        navigationItem.title = "Kindle"
        printBooks()
        
    }
    
    // MARK: - TableView Datasource methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBooks?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
    
        let book = allBooks?[indexPath.row]
        
//        cell.textLabel?.text = book?.title ?? "No Books Added Yet!"
//        cell.imageView?.image = book?.image
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    
    // MARK: - Functions

    func printBooks() {
        
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


}

