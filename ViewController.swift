//
//  ViewController.swift
//  timer
//
//  Created by 高溶 on 2021/07/11.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ViewImage: UIImageView!
    
    @IBOutlet weak var ViewStart: UIButton!
    
    @IBOutlet weak var ViewStop: UIButton!
    
    var timer = Timer()
    
    var count = Int()
    
    var ImageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ViewStop.isEnabled = true
        ViewStart.isEnabled = false
        //ストープボタンを押せる
        //スタートボタンを押せなくなる
        
        count = 0
        //countの最初値
        
        for i in 0..<5{
            print(i)
            let image = UIImage(named:"\(i)")
            ImageArray.append(image!)
            //0~4の画像をImageArrayの中に入れていく
        }
    }

    func StartTimer(){
        timer = Timer .scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    //设置一个定时器
    
    @objc func timerUpdate(){
        count = count + 1
        
        if count > 4{
            count = 0
        }
        
        ViewImage.image = ImageArray[count]
        
    }
    //在这里对timer中的selector即每隔一个时间段中要触发的事件进行了定义。
    
    @IBAction func Stop(_ sender: Any) {
        ViewStop.isEnabled = false
        ViewStart.isEnabled = true
        timer.invalidate()
        
    }
    //当按stop时，解除timer使之无效。
    
    
    @IBAction func Start(_ sender: Any) {
        ViewStop.isEnabled = true
        ViewStart.isEnabled = false
        StartTimer()
    }
    //当按start时，启动在此前设置好的StartTimer函数。

}

