//
//  PageCell.swift
//  Book Viewer
//
//  Created by Hansa Anuradha on 1/28/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class PageCell : UICollectionViewCell {
    
    // MARK: - Properties
    
    var page : Page? {
        didSet {
            textLabel.text = page?.text
        }
    }

    // Lets create a label for page content
    private var textLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers

    // Lets create a Page Cell here
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Add the text label to the view
        addSubview(textLabel)
        // Lets set some constrants to taxt label
        textLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        textLabel.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        textLabel.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -8).isActive = true
        textLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
