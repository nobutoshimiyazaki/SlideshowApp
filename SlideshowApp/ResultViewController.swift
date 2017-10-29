//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 宮崎伸敏 on 2017/10/24.
//  Copyright © 2017年 宮崎伸敏. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    var name = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "\(name)")
        imageView.image = image
        
        
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
