//
//  ViewController.swift
//  demo07
//
//  Created by admin on 2023-03-22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = RestApi()
        api.getPosts()
        
        //let post = Post()
        
        api.addPost(post: ["title": " ", "body": "", "userId": 1])
    }


}

