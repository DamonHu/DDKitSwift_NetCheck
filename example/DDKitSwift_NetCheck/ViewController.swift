//
//  ViewController.swift
//  DDNetCheck
//
//  Created by Damon on 2025/4/3.
//

import UIKit
import DDKitSwift

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.start()
        }
    }

    func start() {
        let plugin = DDKitSwift_NetCheck(url: "https://baidu.com")
        DDKitSwift.regist(plugin: plugin)
        DDKitSwift.show()
    }

}

