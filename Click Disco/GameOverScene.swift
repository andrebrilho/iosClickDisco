//
//  GameOverScene.swift
//  Click Disco
//
//  Created by André Brilho on 26/08/16.
//  Copyright © 2016 classroomM. All rights reserved.
//

import Foundation
import SpriteKit


class GameOverScene: SKScene {

    let clickSound = SKAction.playSoundFileNamed("hora_do_show.wav", waitForCompletion: false)
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "fundo2")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 170
        gameOverLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.75)
        gameOverLabel.fontColor = UIColor.whiteColor()
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let finalScoreLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        finalScoreLabel.text = "Score: \(scoreNumber)"
        finalScoreLabel.fontSize = 100
        finalScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.6)
        finalScoreLabel.fontColor = UIColor.whiteColor()
        finalScoreLabel.zPosition = 1
        self.addChild(finalScoreLabel)
        
        let defaults = NSUserDefaults()
        var highScoreNumber = defaults.integerForKey("highScoreSaved")
        
        if scoreNumber > highScoreNumber {
        
            highScoreNumber = scoreNumber
            defaults.setInteger(highScoreNumber, forKey: "highScoreSaved")
            
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 100
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        highScoreLabel.fontColor = UIColor.whiteColor()
        highScoreLabel.zPosition = 1
        self.addChild(highScoreLabel)
        
        
        let restarLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        restarLabel.text = "Restart"
        restarLabel.fontSize = 105
        restarLabel.fontColor = SKColor.blackColor()
        restarLabel.zPosition = 1
        restarLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        restarLabel.name = "restarButton"
        self.addChild(restarLabel)
        
        let exitLabel = SKLabelNode(fontNamed: "DeathRattle BB")
        exitLabel.text = "Exit"
        exitLabel.fontSize = 105
        exitLabel.fontColor = SKColor.blackColor()
        exitLabel.zPosition = 1
        exitLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.2)
        exitLabel.name = "exitButton"
        self.addChild(exitLabel)
        

        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(pointOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            if nameOfTappedNode == "restarButton"{
            
                self.runAction(clickSound)
                
                let sceneToMoveTo = GameScene(size: self.size)
                    sceneToMoveTo.scaleMode = self.scaleMode
                    let sceneTransition = SKTransition.fadeWithDuration(0.2)
                    self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
            
            }
            
            if nameOfTappedNode == "exitButton"{
            
                let sceneToMoveTo = MainMenuScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let sceneTransition = SKTransition.fadeWithDuration(0.2)
                self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)

                
            }
        
        }

}

}
