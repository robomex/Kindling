//
//  ViewController.swift
//  Kindling
//
//  Created by Tony Morales on 4/15/15.
//  Copyright (c) 2015 Tony Morales. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.addSubview(CardView(frame: CGRectMake(20.0, 20.0, 120.0, 200.0)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

