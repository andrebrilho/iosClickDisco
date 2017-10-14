//
//  MainMenuScene.swift
//  Click Disco
//
//  Created by André Brilho on 26/08/16.
//  Copyright © 2016 classroomM. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene: SKScene {
    
    let clickSound = SKAction.playSoundFileNamed("hora_do_show.wav", waitForCompletion: false)
    let Sound = SKAction.playSoundFileNamed("birl.wav", waitForCompletion: false)
    let playAkiBody = SKAction.playSoundFileNamed("aki_bodybulder.mp3", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "fundo2")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        runAction(playAkiBody)
        
        
        
        let gameOverLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        gameOverLabel.text = "Que não vai DÁ"
        gameOverLabel.fontSize = 140
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameOverLabel.fontColor = UIColor.whiteColor()
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let explicacaoLabel2 = SKLabelNode(fontNamed: "DeathRattle BB")
        explicacaoLabel2.text = "Aki é Bodybuilder..."
        explicacaoLabel2.fontSize = 120
        explicacaoLabel2.position = CGPoint(x: self.size.width/2, y: self.size.height*0.50)
        explicacaoLabel2.fontColor = UIColor.whiteColor()
        explicacaoLabel2.zPosition = 1
        
        self.addChild(explicacaoLabel2)
        
        let explicacaoLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        explicacaoLabel.text = "...Ta Saindo da Jaula o Monstro"
        explicacaoLabel.fontSize = 100
        explicacaoLabel.fontColor = SKColor.whiteColor()
        explicacaoLabel.zPosition = 1
        explicacaoLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.30)
        self.addChild(explicacaoLabel)
        
        let playGameLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        playGameLabel.text = "É hora do SHOW PORRA..."
        playGameLabel.fontSize = 120
        playGameLabel.fontColor = SKColor.blackColor()
        playGameLabel.zPosition = 1
        playGameLabel.name = "playGame"
        playGameLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.05)
        self.addChild(playGameLabel)
        
    }
    
    override func willMoveFromView(view: SKView) {
        //self.runAction(Sound)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(pointOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "playGame"{
                
                self.runAction(clickSound)
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fadeWithDuration(0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
                
                
            }

}

}

}
