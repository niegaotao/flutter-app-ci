//
//  ViewController.swift
//  iOS
//
//  Created by 聂高涛 on 2022/2/18.
//


import UIKit
@_exported import Flutter

class EXAppViewController: NXViewController {
    let engine = FlutterEngine(name: "explorer")
    
    var flutter : FlutterViewController? = nil
    var channel : FlutterMethodChannel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        self.engine.run()
        
        self.flutter = FlutterViewController(engine: self.engine, nibName: nil, bundle: nil)
        self.channel = FlutterMethodChannel(name: "App", binaryMessenger: self.flutter!.binaryMessenger)
        self.channel?.setMethodCallHandler { call, result in
            print("call.method=\(call.method)")
            if(call.method == "exit"){
                self.flutter?.dismiss(animated: true, completion: nil)
            }
        }
        
        self.naviView.title = "EXAppViewController"
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let __flutter = self.flutter {
            
            
            self.present(__flutter, animated: true, completion: nil)
            
            self.channel?.invokeMethod("updateAppearance", arguments: ["backgroundColor":[0,0,0], "foregroundColor":[255,255,255]], result: nil)
            
            
//            let channel = FlutterBasicMessageChannel(name: "explorer", binaryMessenger: __flutter.binaryMessenger)
//            channel.setMessageHandler { value, reply in
//                //收到来自flutter的消息
//            }
//            channel.sendMessage("----")//发送给flutter的消息
            
        }
        
        
    }

}



