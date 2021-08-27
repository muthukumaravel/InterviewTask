//
//  ViewController.swift
//  Rotate
//
//  Created by Rishan on 26/08/21.
//  Copyright ©Rishan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var start: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "starLoader")
        start.backgroundColor = .clear
        start.layer.cornerRadius = 5
        start.layer.borderWidth = 1
        
    }
    @IBAction func start(_ sender: Any) {
        startLoader()
        getData()
    }
    
    func startLoader(){
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotation.toValue = Double.pi * 2
        rotation.duration = 1 // or however long you want ...
        rotation.isCumulative = false
        rotation.repeatCount = Float.greatestFiniteMagnitude
        imageView.layer.add(rotation, forKey: "rotationAnimation")
    }
    
    func getData() {
        
        let url = URL(string: MyVariables.link)
        let task = URLSession.shared.dataTask(with: url!){(data, response, error) in
            
            guard data != nil else { return }
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
                print("Server error!")
                return
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            print("Dispatch")
            
            self.imageView.layer.removeAnimation(forKey: "rotationAnimation")
        }
        task.resume()
    }
}

