//
//  ViewController.swift
//  AppVersionSample
//
//  Created by Ankush Kushwaha on 7/6/18.
//  Copyright © 2018 Ankush Kushwaha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        guard let info = AppInfo() else {
            return
        }
        let infoText = "AppVersion: \(info.version) \nBuild: \(info.build) \nGit hash: \(info.gitCommitSHA)"
        print(infoText)

        infoLabel.text = infoText

        
    }

}



