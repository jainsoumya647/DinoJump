//
//  GameScene.swift
//  Dino Jump
//
//  Created by Soumya Jain on 10/09/20.
//  Copyright © 2020 Soumya Jain. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let heightOfGround: CGFloat = 20
    var ground: SVMovingGround!
    var dino: SVDino!
    override func didMove(to view: SKView) {
        let size = CGSize(width: view.frame.size.width, height: heightOfGround)
        backgroundColor = .skyBlueColor
        self.addGround(size: size)
        self.addDino()
    }
    
    func addGround(size: CGSize) {
        guard let view = self.view else {
            return
        }
        ground = SVMovingGround(size: size)
        ground.position = CGPoint(x: 0, y: view.center.y)
        addChild(ground)
    }
    
    func addDino() {
        dino = SVDino(size: CGSize(width: 45, height: 55))
        dino.position = CGPoint(x: 70, y: dino.size.height/2 + self.ground.size.height/2 + self.ground.position.y + 5)
        addChild(dino)
        self.dino.breathe()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.ground.startMoving()
        self.dino.stopBreathe()
        self.dino.startRunning()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}
