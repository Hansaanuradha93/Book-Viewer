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

    // Lets create a label for page content
    var textLabel : UILabel = {
        let label = UILabel()
        label.text = "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32."
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
