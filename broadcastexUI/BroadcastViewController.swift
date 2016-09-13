//
//  BroadcastViewController.swift
//  broadcastexUI
//
//  Created by crossle on 30/8/2016.
//  Copyright © 2016 shou. All rights reserved.
//

import ReplayKit

class BroadcastViewController: UIViewController {

    @IBAction func startBroadcast(_ sender: AnyObject) {
        // request network get broadcast url
        self.userDidFinishSetup()
    }

    // Called when the user has finished interacting with the view controller and a broadcast stream can start
    func userDidFinishSetup() {
        // Broadcast url that will be returned to the application
        let broadcastURL = URL(string:"https://shou.tv/crossle")
        
        // Service specific broadcast data example which will be supplied to the process extension during broadcast
        let userID = "crossle"
        let userToken = "crossle_token"
        let endpointURL = "https://upload.shou.tv"
        let setupInfo: [String: NSCoding & NSObjectProtocol] =  [ "userID" : userID as NSString, "userToken": userToken as NSString, "endpointURL" : endpointURL as NSString ]
        
        // Set broadcast settings
        let broadcastConfiguration = RPBroadcastConfiguration()
        broadcastConfiguration.clipDuration = 1
        
        // Tell ReplayKit that the extension is finished setting up and can begin broadcasting
        self.extensionContext?.completeRequest(withBroadcast: broadcastURL!, broadcastConfiguration: broadcastConfiguration, setupInfo: setupInfo)
    }
    
    func userDidCancelSetup() {
        let error = NSError(domain: "tv.shou", code: -1, userInfo: nil)
        // Tell ReplayKit that the extension was cancelled by the user
        self.extensionContext?.cancelRequest(withError: error)
    }
}
