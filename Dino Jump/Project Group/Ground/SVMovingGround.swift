//
//  SVMovingGround.swift
//  Dino Jump
//
//  Created by Soumya Jain on 10/09/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import SpriteKit

class SVMovingGround: SKSpriteNode {
    
    let numberOfSegments = 20
    
    init(size: CGSize) {
        super.init(texture: nil, color: .brown, size: CGSize(width: size.width*2, height: size.height))
        anchorPoint = CGPoint(x: 0, y: 0.5)
        for i in 0..<numberOfSegments {
            var segmentColor: UIColor!
            if i%2 == 0 {
                segmentColor = .lightGreen
            } else {
                segmentColor = .darkGreen
            }
            let width = size.width*2/CGFloat(numberOfSegments)
            let segment = SKSpriteNode(color: segmentColor, size: CGSize(width: width, height: size.height))
            segment.position = CGPoint(x: CGFloat(i)*width, y: 0)
            segment.anchorPoint = CGPoint(x: 0, y: 0.5)
            addChild(segment)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startMoving() {
        let action = SKAction.moveBy(x: -frame.size.width/2, y: 0, duration: 1)
        let reset = SKAction.moveTo(x: 0, duration: 0)
        
        let sequence = SKAction.sequence([action, reset])
        
        run(SKAction.repeatForever(sequence))
        
    }
    
}
