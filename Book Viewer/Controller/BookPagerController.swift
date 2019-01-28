//
//  BookPagerController.swift
//  Book Viewer
//
//  Created by Hansa Anuradha on 1/28/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class BookPagerController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    // MARK: - Properties
    fileprivate let cellID = "CellID"
    
    // MARK: - View Controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation conteoller background color
        collectionView.backgroundColor = .white
        
        // Lets register UICollectionView cell here
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        // Lets set the Horizotal scrolling in collection view here
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        
        // Lets set the ability to Swipe between Pages here
        collectionView.isPagingEnabled = true
        
        // Lets remove line spacing between pages here
        layout?.minimumLineSpacing = 0
        
        // Lets set navigation title here
        navigationItem.title = "Book"
        
    }
    
    // MARK: - CollectionViewController Datasource methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Delegate methods
    
    // Resize the UICollectionView cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }


    
}
