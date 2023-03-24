//
//  RestApi.swift
//  demo07
//
//  Created by admin on 2023-03-22.
//

import Foundation

class RestApi {
    
    func getPosts() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!){ (data, response, error) in
            
            if let result = data, let resp = response as? HTTPURLResponse {
                if (resp.statusCode == 200){
                    print("articles trouvés")
                    let posts = try? JSONSerialization.jsonObject(with: result, options: []) as? [[String:Any]]
                    for post in posts!{
                        print("\(post["title"]!)")
                    }
                }
                
            }
        }
        
        task.resume()
    }
    
    func addPost(post: [String:Any]) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        let session = URLSession.shared
        
        //prepare request
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: post)
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request){ (data, response, error) in
            
            if let result = data, let resp = response as? HTTPURLResponse {
                if (resp.statusCode == 201){
                    print("article ajouté !")
                    let new = try? JSONSerialization.jsonObject(with: result, options: []) as? [String:Any]
                    print("Son nouvel id est \(new?["id"]!)")
                }
            }
        }
        
        task.resume()
    }
        
}

