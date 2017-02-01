//
//  ViewController.swift
//  instaclone
//
//  Created by Mario Delgado on 1/31/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit
import AFNetworking

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var names: [String]!
    var data: [NSDictionary]!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        
        names = ["mary", "steve"]
        data = []
        
        
        
        
        let url = NSURL(string: "https://api.instagram.com/v1/users/self/media/recent/?access_token=1342424.d063e25.21fa293a5c444501bac6979460c75417")!
        let request = NSURLRequest(url: url as URL)
        
        let task = URLSession.shared.dataTask(with: url as URL) { (data, response, error) -> Void in
            
            if error != nil {
                print("thers an error in the log")
            } else {
                
                DispatchQueue.main.async() {
                    let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    print(json)
                    
                    self.data = json["data"] as! [NSDictionary]
                    self.tableView.reloadData()
                    
                    
                    
                }
            }
            
        }
        
        task.resume()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "photoCell")! as! photoCell
        
        
        let photo = self.data[indexPath.row]
        //let user = photo["user"] as! NSDictionary
        
        let username = photo.value(forKeyPath: "user.username") as! String
        let photourl = photo.value(forKeyPath: "images.low_resolution.url") as! String

        
       // cell.usernameLabel.text = user["username"] as! String
        
        cell.usernameLabel.text = username
        cell.photoImageView.setImageWith(NSURL(string: photourl)! as URL)
        
        return cell
    }
    

}

