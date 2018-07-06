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
        let formattedInfoText = "AppVersion: \(info.version) \nBuild: \(info.build) \nGit hash: \(info.gitCommitSHA)"

        print(formattedInfoText)

        infoLabel.text = formattedInfoText

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

