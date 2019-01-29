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
    
    var book : Book?
    
    // MARK: - View Controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Lets set navigation title here
        navigationItem.title = book?.title
        
        // Lets add a close button on navigation bar here
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector (handleCloseBook))
        
        // Set navigation conteoller background color
        collectionView.backgroundColor = .white
        
        // Lets register UICollectionView cell here
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellID)
        
        // Lets set the Horizotal scrolling in collection view here
        let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        
        // Lets set the ability to Swipe between Pages here
        collectionView.isPagingEnabled = true
        
        // Lets remove line spacing between pages here
        layout?.minimumLineSpacing = 0

        
    }
    
    // MARK: - CollectionViewController Datasource methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageCell
        // Lets set the page texct here
        pageCell.page = book?.pages[indexPath.item]
        return pageCell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout Delegate methods
    
    // Resize the UICollectionView cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // colletionView Item Height = View height - statusBarHeight - navigationBarHeight
        // colletionView Item Height = view.frame.height - 130 (rough value)
        return CGSize(width: view.frame.width, height: view.frame.height - 130)
    }


    // MARK: - Support Functions
    @objc
    func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }

    
}
