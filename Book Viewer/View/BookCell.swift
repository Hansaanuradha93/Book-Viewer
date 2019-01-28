//
//  BookCell.swift
//  Book Viewer
//
//  Created by Hansa Anuradha on 1/27/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    
    var book : Book? {
        didSet {
            coverImageView.image = book?.image
            titleLabel.text = book?.title
            authorLabel.text = book?.author
        }
    }
    
    // Lets create a image view here
    private var coverImageView : UIImageView = {
        let imageView = UIImageView()
        // Lets enable auto layout here
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // Lets create a label for title here
    private var titleLabel : UILabel = {
        let label = UILabel()
//        label.text = "Lets Add Title Here"
        // Lets enable auto layout here
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Lets create a label from author here
    private var authorLabel : UILabel = {
        let label = UILabel()
//        label.text = "lets add author"
        // Lets enable auto layout here
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Lets create BookCell here
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Lets add the image view to the book cell here
        addSubview(coverImageView)
        // Lets add the contraints here
        coverImageView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 8).isActive = true
        coverImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        coverImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        // Lets add the title label to the book cell here
        addSubview(titleLabel)
        // Lets add the constraints here
        titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -8).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        // Lets add the author label here
        addSubview(authorLabel)
        // Lets add the contraints here
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor, constant: 0).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
