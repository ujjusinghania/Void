//
//  VoidViewController.swift
//  Void
//
//  Created by Ujjwal Singhania on 2/3/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit

class VoidViewController: UIViewController {
    
    @IBOutlet weak var triangleAnimateImageView: UIImageView!
    var triangleAnimateImageCount: Int = 1
    
    
    func animateTriangle() {
        
        var triangleAnimateImageArray = [UIImage]()
        
        for pictureNumber in 1...19
        {
            let imageName : String = "Triangle-Animate-\(pictureNumber).png"
            let image  = UIImage(named:imageName)
            triangleAnimateImageArray.append(image!)
        }
        
        triangleAnimateImageView.animationImages = triangleAnimateImageArray
        triangleAnimateImageView.animationDuration = 0.3333333333
        triangleAnimateImageView.startAnimating()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        animateTriangle()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
