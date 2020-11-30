//
//  ViewController.swift
//  FlutterUnitTest
//
//  Created by ReverseScale on 11/30/2020.
//  Copyright (c) 2020 ReverseScale. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func onFirstAction(_ sender: Any) {
        FlutterBoostPlugin.open("pmapp://erp/first", urlParams:[kPageCallBackId:"MycallbackId#1"], exts: ["animated":true], onPageFinished: { (_ result:Any?) in
            print(String(format:"call me when page finished, and your result is:%@", result as! CVarArg));
        }) { (f:Bool) in
            print(String(format:"page is opened"));
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

