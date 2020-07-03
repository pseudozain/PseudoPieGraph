//
//  PseudoPieGraph+Extensions.swift
//  PseudoPieGraph
//
//  Created by Zain on 03/07/2020.
//  Copyright © 2020 PseudoLabs. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Private methods

internal extension PseudoPieGraph {
    @objc
    func onTouch(_ gestureRecognizer: UITapGestureRecognizer) {
        guard selectionEnabled else { return }
        
        let location = gestureRecognizer.location(in: self)
        let distance = sqrt(pow(location.x - bounds.width/2, 2) + pow(location.y - bounds.height/2, 2))
        let externalRadius = bounds.width/2 - (arcEdge < 0 ? 0 : arcEdge)
        let internalRadius = emptyRadius
        
        guard distance <= externalRadius && distance >= internalRadius else { return }
        
        var angle = atan2(location.y - bounds.width/2, location.x - bounds.height/2)
        angle = angle < 0 ? angle + CGFloat(2*Double.pi) : angle
        

        let selectedPath = angles.enumerated().filter { [unowned self] in self.angle(angle, isBetween: $0.1.start, and: $0.1.end) }.map { $0.0 }.first

        guard let index = selectedPath else { return }
        
        self.selectedIndex = index
        sendActions(for: .valueChanged)
    }
    
    func drawChart(inRect rect: CGRect, components: [PieChartComponent] ) {

        guard components.count > 0 else { return }
        
        let chartCenter = CGPoint(x: rect.midX, y: rect.midY)
        
        var i = 0
        paths.removeAll()
        angles.removeAll()
        
        var startAngle = self.startAngle
        
        let externalRadius = frame.width/2 - (arcEdge < 0 ? 0 : arcEdge)
        let internalRadius = emptyRadius
        let arcWidth = externalRadius - internalRadius
        let radius = externalRadius - arcWidth/2
        
        for component in components {
            let percentage = component.number * 100
            let degree = percentage * 360.0 / 100.0
            let radian = degree * Double.pi / 180.0
            let endAngle = CGFloat(radian)
            
            let piePath = UIBezierPath()
            
            piePath.addArc(withCenter: chartCenter,
                           radius: radius + (i == selectedIndex ? arcEdge/2 : 0),
                           startAngle: startAngle,
                           endAngle: endAngle + startAngle,
                           clockwise: true)
            angles.append(Angle(start: actualRadAngle(angle: startAngle), end: actualRadAngle(angle: endAngle + startAngle)))
            startAngle = endAngle + startAngle
            
            component.color.setStroke()
            piePath.lineWidth = i == selectedIndex ? arcWidth+arcEdge : arcWidth
            piePath.stroke()
            paths.append(piePath)
            
            i += 1
        }
    }
    
    func actualRadAngle(angle: CGFloat) -> CGFloat {
        let actualAngle = remainder(angle, CGFloat(2*Double.pi))
        return actualAngle < 0 ? actualAngle + CGFloat(2*Double.pi) : actualAngle
    }
    
    func angle(_ angle: CGFloat, isBetween startAngle: CGFloat, and endAngle: CGFloat) -> Bool {
        guard endAngle < startAngle else { return (startAngle...endAngle).contains(angle) }
        return (startAngle...CGFloat(2*Double.pi)).contains(angle) || (0...endAngle).contains(angle)
    }
}
