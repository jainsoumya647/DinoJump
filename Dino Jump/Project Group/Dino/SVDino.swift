//
//  SVDino.swift
//  Dino Jump
//
//  Created by Soumya Jain on 11/09/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import Foundation
import SpriteKit

class SVDino: SKSpriteNode {
    
    var leftFoot: SVDinoLeg!
    var rightFoot: SVDinoLeg!
    var dinoBody: SKSpriteNode!
    
    init(size: CGSize) {
        super.init(texture: nil, color: .clear, size: size)
        dinoBody = SKSpriteNode(imageNamed: "dinosaur")
        dinoBody.zPosition = -1
        addChild(dinoBody)
        let legSize = CGSize(width: 5, height: 8)
        rightFoot = SVDinoLeg(size: legSize)
        let yPos: CGFloat = -size.height/2 + rightFoot.size.height/2 - 5
        var pos = CGPoint(x: -3, y: yPos)
        rightFoot.position = pos
        dinoBody.addChild(rightFoot)
        
        leftFoot = SVDinoLeg(size: legSize)
        pos.x = pos.x - (legSize.width + 4)
        leftFoot.position = pos
        dinoBody.addChild(leftFoot)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func startRunning() {
        let up = SKAction.moveBy(x: 0, y: 2, duration: 0.05)
        let down = SKAction.moveBy(x: 0, y: -2, duration: 0.05)
        self.leftFoot.run(up) {
            self.leftFoot.run(down)
            self.rightFoot.run(up) {
                self.rightFoot.run(down) {
                    self.startRunning()
                }
            }
        }
    }
    
    func breathe() {
        let breatheOut = SKAction.moveBy(x: 0, y: -2, duration: 1)
        let breatheIn = SKAction.moveBy(x: 0, y: 2, duration: 1)
        let breathe = SKAction.sequence([breatheOut, breatheIn])
        self.dinoBody.run(SKAction.repeatForever(breathe))
    }
    
    func stopBreathe() {
        self.dinoBody.removeAllActions()
    }
}
