//
//  FirstViewController.swift
//  broadcast
//
//  Created by crossle on 30/8/2016.
//  Copyright © 2016 shou. All rights reserved.
//

import UIKit
import ReplayKit

class FirstViewController: UIViewController, RPBroadcastActivityViewControllerDelegate, RPBroadcastControllerDelegate {

    var broadcastController : RPBroadcastController?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func broadcastClick(_ sender: AnyObject) {
            RPBroadcastActivityViewController.load { (broadcastAVC, error) in
                if let broadcastAVC = broadcastAVC {
                    broadcastAVC.delegate = self
                    self.present(broadcastAVC, animated: true)
                }
            }

    }

    // MARK: - RPBroadcastActivityViewControllerDelegate
    func broadcastActivityViewController(_ broadcastAVC: RPBroadcastActivityViewController, didFinishWith broadcastController: RPBroadcastController?, error: Error?) {
        print("=====hello delegate \(broadcastController?.broadcastURL) (error)")
        self.broadcastController = broadcastController
        self.broadcastController?.delegate = self
        broadcastAVC.dismiss(animated: true) {
            self.broadcastController?.startBroadcast(handler: { error in
                print("start broadcast \(error)")
                print("\(broadcastController?.broadcastExtensionBundleID)")
                print("==url=\(broadcastController?.broadcastURL)")
                print("==serviceInfo=\(broadcastController?.serviceInfo)")
            })
        }
    }
    
    // MARK: - RPBroadcastControllerDelegate
    func broadcastController(_ broadcastController: RPBroadcastController, didFinishWithError error: Error?) {
        print("broadcastController====delegate")
    }

    func broadcastController(_ broadcastController: RPBroadcastController, didUpdateServiceInfo serviceInfo: [String : NSCoding & NSObjectProtocol]) {
        print("broadcastController====didUpdateServiceInfo")
    }

}

