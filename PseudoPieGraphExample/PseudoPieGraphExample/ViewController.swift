//
//  ViewController.swift
//  PseudoPieGraphExample
//
//  Created by Zain on 03/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import UIKit
import PseudoPieGraph

class ViewController: UIViewController {
    
    
    @IBOutlet weak var heading: UILabel!
    
    @IBOutlet weak var label: UILabel!
    
    lazy var circledPieGraph: PseudoPieGraph = {
        let pieGraph = PseudoPieGraph()
        pieGraph.startAngleDeg = 45
        pieGraph.selectedArcEdge = -5
        pieGraph.emptyRadius = 0
        return pieGraph
    }()
    
    lazy var fullPieGraph: PseudoPieGraph = {
        let pieGraph = PseudoPieGraph()
        pieGraph.startAngleDeg = 180
        pieGraph.selectedArcEdge = 8
        pieGraph.emptyRadius = 0
        return pieGraph
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(circledPieGraph)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        circledPieGraph.frame = CGRect(x: view.bounds.width/2 - 125, y: label.frame.origin.y + label.frame.height + 40, width: 250, height: 250)
        
        circledPieGraph.components = [(number: 0.2, color: .orange), (number: 0.1, color: .systemBlue), (number: 0.15, color: .systemTeal), (number: 0.15, color: .systemRed), (number: 0.25, color: .purple), (number: 0.15, color: .systemPink)]
        
        fullPieGraph.frame = CGRect(x: view.bounds.width/2 - 100, y: circledPieGraph.frame.origin.y + circledPieGraph.frame.height + 30, width: 200, height: 200)
        
        fullPieGraph.components = [(number: 0.1, .systemBlue), (number: 0.05, .systemOrange), (number: 0.13, .systemTeal), (number: 0.18, .systemPink), (number: 0.15, .systemYellow), (number: 0.05, .magenta), (number: 0.08, .systemPurple), (number: 0.12, .orange), (number: 0.08, .systemGray), (number: 0.06, .purple)]
        
        
        
    }


}

