//
//  ViewController.swift
//  simplebeacon
//
//  Created by Hiroyuki Tsujino on 11/10/14.
//  Copyright (c) 2014 Hiroyuki Tsujino. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView?
    var beacons: [CLBeacon]?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if(beacons != nil) {
                return beacons!.count
            } else {
                return 0
            }
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell:UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("MyIndentifier") as? UITableViewCell
            
            if(cell == nil){
                cell = UITableViewCell(style:UITableViewCellStyle.Subtitle, reuseIdentifier: "MyIdentifier")
                cell!.selectionStyle = UITableViewCellSelectionStyle.None
            }
            
            let beacon:CLBeacon = beacons![indexPath.row]
            var proximityLabel:String! = ""
            
            switch beacon.proximity {
            case CLProximity.Far:
                proximityLabel = "Far"
            case CLProximity.Near:
                proximityLabel = "Near"
            case CLProximity.Immediate:
                proximityLabel = "Immediate"
            case CLProximity.Unknown:
                proximityLabel = "Unknown"
            }
            
            cell!.textLabel.text = proximityLabel
            
            let detailLabel: String = "Major: \(beacon.major.integerValue)," +
                "Minor: \(beacon.minor.integerValue)," +
                "RSSI: \(beacon.rssi as Int)," +
                "UUID: \(beacon.proximityUUID.UUIDString)"
            cell!.detailTextLabel!.text = detailLabel
            
            return cell!
    }
}

extension ViewController: UITableViewDelegate {

}
