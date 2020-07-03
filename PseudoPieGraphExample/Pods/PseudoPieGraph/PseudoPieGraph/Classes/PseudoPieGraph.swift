//
//  PseudoPieGraph.swift
//  PseudoPieGraph
//
//  Created by Zain on 03/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import Foundation
import UIKit

public typealias PieChartComponent = (number: Double, color: UIColor)

@IBDesignable
open class PseudoPieGraph: UIControl {
    
    // MARK: - IBInspectable
    
    @IBInspectable
    public var startAngleDeg: CGFloat {
        get {
            return startAngle * 180 / CGFloat(Double.pi)
        }
        set (angle) {
            startAngle = angle * CGFloat(Double.pi) / 180
        }
    }
    
    @IBInspectable
    public var startAngleRad: CGFloat {
        get {
            return startAngle
        }
        set (angle) {
            startAngle = angle
        }
    }
    
    @IBInspectable
    public var selectedArcEdge: CGFloat {
        get {
            return arcEdge
        }
        set(edge) {
            arcEdge = edge
            selectedIndex = arcEdge == 0 ? -1 : 1
        }
    }
    
    @IBInspectable
    public var emptyRadius: CGFloat = 0
    
    // MARK: - Public properties
    
    public var selectionEnabled: Bool = true {
        didSet {
            selectedIndex = selectionEnabled ? 0 : -1
        }
    }
    
    public var selectedIndex = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var components: [PieChartComponent] = [(number: 0.2, color: .orange), (number: 0.2, color: .systemBlue), (number: 0.2, color: .systemTeal), (number: 0.2, color: .purple), (number: 0.2, color: .systemPink)] {
        didSet {
            if let _ = rect {
                setNeedsDisplay()
            }
        }
    }
    
    // MARK: - Private Properties
    
    internal var startAngle: CGFloat = 0 {
        didSet {
            startAngle = actualRadAngle(angle: startAngle)
            setNeedsDisplay()
        }
    }
    
    internal var arcEdge: CGFloat = 0
    internal var rect: CGRect?
    internal var paths = [UIBezierPath]()
    internal var angles = [Angle]()
    
    internal typealias Angle = (start: CGFloat, end: CGFloat)
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        backgroundColor = .clear
        let touchGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.onTouch(_:)))
        addGestureRecognizer(touchGestureRecognizer)
    }
    
    // MARK: - Drawing
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.rect = rect
        drawChart(inRect: rect, components: components)
    }
}


