//
//  BookPagerController.swift
//  Book Viewer
//
//  Created by Hansa Anuradha on 1/28/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class BookPagerController : UICollectionViewController {
    
    
    // MARK: - Properties
    fileprivate let cellID = "CellID"
    
    // MARK: - View Controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation conteoller background color
        collectionView.backgroundColor = .white
        
        // Lets set navigation title here
        navigationItem.title = "Book"
        
        // Lets register UICollectionView cell here
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
    }
    
    // MARK: - CollectionViewController Datasource methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        cell.backgroundColor = .red
        
        return cell
    }

    
}
