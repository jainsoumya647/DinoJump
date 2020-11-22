//
//  SVDinoLeg.swift
//  Dino Jump
//
//  Created by Soumya Jain on 12/09/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import SpriteKit

class SVDinoLeg: SKSpriteNode {
    
    init(size: CGSize) {
        super.init(texture: nil, color: .dragonGreen, size: size)
        let shape = SKShapeNode()
        shape.path = UIBezierPath(roundedRect: CGRect(x: -2, y: -3, width: size.width, height: size.height), cornerRadius: size.height/2).cgPath
        shape.fillColor = .dragonGreen
        shape.strokeColor = .black
        shape.lineWidth = 1
        addChild(shape)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
