//
//  BLEPeripheralViewController.swift
//  Actors
//
//  Created by Dario Lencina on 10/24/15.
//  Copyright © 2015 dario. All rights reserved.
//

import UIKit
import Theater

public class PeripheralViewController : UITableViewController {
    
    @IBOutlet weak var statusCell : UITableViewCell!
    
    @IBOutlet weak var onclick : UITableViewCell!
    
    @IBOutlet weak var advertisingRow: UITableViewCell!
    
    @IBOutlet weak var advertisingButton: UIButton!
    
    var peripheral : ActorRef = AppActorSystem.shared.actorOf(PeripheralActor.self, name: "PeripheralActor")
    
    public override func viewWillAppear(animated: Bool) {
        peripheral ! PeripheralMsg.SetPeripheralViewController(sender: Optional.None, ctrl : self)
    }
    
    public override func viewWillDisappear(animated: Bool) {
        if(self.isBeingDismissed() || self.isMovingFromParentViewController()){
            
        }
    }
    
    @IBAction func toggleAdvertising(sender: AnyObject) {
        peripheral ! PeripheralMsg.ToggleAdvertising(sender : Optional.None)
    }
    
    @IBAction func onClick(sender: UIButton) {
        peripheral ! PeripheralMsg.OnClick(sender : Optional.None)
    }
    
    deinit {
        peripheral ! Harakiri(sender: Optional.None)
    }
}