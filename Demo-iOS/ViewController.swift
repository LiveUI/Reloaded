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
        
        let colors = ["red", "blue", "green", "yellow", "purple", "ping", "black"]
        var hasChimney = true
        
        for color in colors {
            let loco = try! Locomotive.new()
            loco.color = color
            loco.hasChimney = hasChimney
            try! loco.save()
            
            hasChimney = !hasChimney
        }
        
        let all = try! Locomotive.query.filter("hasChimney" == true).filter(.or, "color" == "green", "color" == "black").sort(by: "color", direction: .orderedAscending).all()
        all.forEach { loco in
            print("Color: \(loco.color ?? "Unknown"); Chimney: \(Bool(loco.hasChimney))")
        }
    }

}

