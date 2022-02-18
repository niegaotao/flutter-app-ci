//
//  ViewController.swift
//  iOS
//
//  Created by 聂高涛 on 2022/2/18.
//

import UIKit
import Flutter

class NXViewController: UIViewController {
    let engine = FlutterEngine(name: "iOS")
    var channel : FlutterMethodChannel? = nil
    var vc : FlutterViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("run:\(engine.run())")
        self.vc = FlutterViewController(engine: self.engine, nibName: nil, bundle: nil)

        self.channel = FlutterMethodChannel(name: "App", binaryMessenger: self.vc!.binaryMessenger)
        self.channel?.setMethodCallHandler({ call, result in
            print("call.method：\(call.method)")
        })
        
        self.channel?.invokeMethod("updateAppearance", arguments: ["backgroundColor":[0,0,0],"foregroundColor":[255,255,255]], result: nil)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.channel?.invokeMethod("detail", arguments: nil, result: nil)
        self.vc?.view.backgroundColor = UIColor.black
        self.present(vc!, animated: true, completion: nil)
    }
}

