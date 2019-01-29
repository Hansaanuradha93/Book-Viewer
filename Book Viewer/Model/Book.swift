//
//  Book.swift
//  Book Viewer
//
//  Created by Hansa Anuradha on 1/25/19.
//  Copyright © 2019 Hansa Anuradha. All rights reserved.
//

import UIKit

struct Book {
    let title : String
    let author : String
    let image : UIImage
    let pages : [Page]
    let coverImageUrl : String
    
    init(dictionary : [String : Any]) {
        title = dictionary["title"] as? String ?? ""
        author = dictionary["author"] as? String ?? ""
        
        
        
        image = UIImage(named: "bill")!
        
        // Lets create a [bookPages] type of Page Objects here
        var bookPages = [Page]()

        if let pagesDictionaries = dictionary["pages"] as? [[String : Any]] {
            // Lets go through pageDictionaries one by one here
            for pageDictionary  in pagesDictionaries {
                // Lets capture the page text from pageDictionary here
                if let pageText = pageDictionary["text"] as? String {
                    // Lets create a book obbject to store the caputured page here
                    let page = Page(number: 1, text: pageText)
                    // Lets append the newly captured page to the [bookPages] here
                    bookPages.append(page)
                }
            }
        }
        // Fially initialize the [pages] with [bookPages] here
        pages = bookPages
        
        coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""
    }
}
