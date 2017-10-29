//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 宮崎伸敏 on 2017/10/24.
//  Copyright © 2017年 宮崎伸敏. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageNameArray = [
        "1.jpg",
        "2.jpg",
        "3.jpg",
        ]
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var startButton: UIButton!
    
    
    @IBOutlet weak var goButton: UIButton!
    
    
    @IBOutlet weak var backButton: UIButton!
    
    
    var timer: Timer!
    var timer_sec: Float = 0
    
    
    
    @IBAction func onTapImage(_ sender: Any) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result",sender: nil)
        
    }
    
    
    @IBAction func startView(_ sender: Any) {
        
        // ボタンが押された時に、タイマーを開始・終了するコード
        if self.timer == nil {
            self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(goView(_:)), userInfo: nil, repeats: true)
            
            self.goButton.isEnabled = false
            
            self.backButton.isEnabled = false
            
            
            startButton.setTitle("停止", for: .normal)
            
            
        }
        else {
            self.timer.invalidate()
            self.timer = nil
            
            self.goButton.isEnabled = true
            
            self.backButton.isEnabled = true
            
            
            startButton.setTitle("再生", for: .normal)
            
        }
        
        
    }
    
    @IBAction func goView(_ sender: Any) {
        
        // 表示している画像の番号を1増やす
        dispImageNo += 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        
        
        
    }
    
    @IBAction func backView(_ sender: Any) {
        
        // 表示している画像の番号を1減らす
        dispImageNo -= 1
        
        // 表示している画像の番号を元に画像を表示する
        displayImage()
        
        
        
    }
    
    /// 表示している画像の番号
    var dispImageNo = 0
    
    /// 表示している画像の番号を元に画像を表示する
    func displayImage() {
        
        
        // 画像の番号が正常な範囲を指しているかチェック
        
        // 範囲より下を指している場合、最後の画像を表示
        if dispImageNo < 0 {
            dispImageNo = imageNameArray.count - 1
        }
        
        // 範囲より上を指している場合、最初の画像を表示
        if dispImageNo > imageNameArray.count - 1 {
            dispImageNo = 0
        }
        
        // 表示している画像の番号から名前を取り出し
        let name = imageNameArray[dispImageNo]
        
        // 画像を読み込み
        let image = UIImage(named: name)
        
        // Image Viewに読み込んだ画像をセット
        imageView.image = image
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "1.jpg")
        imageView.image = image
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        let name = imageNameArray[dispImageNo]
        resultViewController.name = name
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
    
    
}

