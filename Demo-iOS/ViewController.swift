//
//  ViewController.swift
//  Demo-iOS
//
//  Created by Ondrej Rafaj on 29/03/2018.
//  Copyright © 2018 LiveUI. All rights reserved.
//

import UIKit
import Reloaded


extension Locomotive: Entity { }


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loco = try! Locomotive.new()
        loco.color = "black"
        loco.hasChimney = true
        try! loco.save()
        
        let all = try! Locomotive.query.filter("hasChimney" == true).sort(by: "color", direction: .orderedDescending).all()
        print(all)
    }

}

