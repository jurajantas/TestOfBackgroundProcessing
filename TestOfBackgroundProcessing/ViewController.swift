//
//  ViewController.swift
//  TestOfBackgroundProcessing
//
//  Created by Juraj Antas on 1/12/18.
//  Copyright © 2018 Ixonos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.labelText.text = "starting."
        DispatchQueue.global().async {
            print("before")
            //this function is doing some real work and produces some results.
            self.waitForMilliSecs(MilliSecs: 3000)
            print("after")

            DispatchQueue.main.async {
                self.labelText.text = "updated."

            }
        }
    }

    func waitForMilliSecs(MilliSecs millisecs: Int) -> Void {
        var date = NSDate()
        let firstTime = Int64(date.timeIntervalSince1970 * 1000)
        var currentTime = firstTime
        while currentTime - firstTime < millisecs {
            date = NSDate()
            currentTime = Int64(date.timeIntervalSince1970 * 1000)
        }
    }

}

