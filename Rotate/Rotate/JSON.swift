//
//  JSON.swift
//  Rotate
//
//  Created by Greens-Apple2 on 26/08/21.
//  Copyright © 2021 Greens-Apple2. All rights reserved.
//

import UIKit

class JSON: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
getData()
    }
    
    func getData(){
        let url = URL(string: MyVariables.link)
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            
            guard data != nil else { return }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
            
        }
        DispatchQueue.main.async {
            self.imageView.layer.removeAnimation(forKey: "rotationAnimation")
        }
        
        task.resume()
    }
    

   

}
