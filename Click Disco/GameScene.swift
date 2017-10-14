//
//  GameScene.swift
//  Click Disco
//
//  Created by André Brilho on 26/08/16.
//  Copyright (c) 2016 classroomM. All rights reserved.
//

import SpriteKit

var scoreNumber = 0

class GameScene: SKScene {
    
    
    
    
    let scoreLabel = SKLabelNode(fontNamed: "DeathRattle BB")
    let playBirl = SKAction.playSoundFileNamed("birl.wav", waitForCompletion: false)
    let play37 = SKAction.playSoundFileNamed("37anos.mp3", waitForCompletion: false)
    let playEitaPorra = SKAction.playSoundFileNamed("eita_porra.mp3", waitForCompletion: false)
    let playAkiBody = SKAction.playSoundFileNamed("aki_bodybulder.mp3", waitForCompletion: false)
    let gameArea: CGRect
    
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let gameAreaMargin = (size.width - playableWidth)/2
        gameArea = CGRect(x: gameAreaMargin, y: 0, width:  playableWidth, height: size.height)
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    
    }
    
    
    
    
    
    
    override func didMoveToView(view: SKView) {
        
        print(UIFont.familyNames())
        
        scoreNumber = 0
        
        let background = SKSpriteNode(imageNamed: "fundo2")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let disc = SKSpriteNode(imageNamed: "birl_1")
        disc.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        disc.zPosition = 2
        disc.name = "discObjeto"
        self.addChild(disc)
        
        
        scoreLabel.fontSize = 250
        scoreLabel.text = "0"
        scoreLabel.fontColor = SKColor.whiteColor()
        scoreLabel.zPosition = 1
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.85)
        self.addChild(scoreLabel)
        
    }
    
    class func printFonts() {
        for familyName in UIFont.familyNames() {
            print("\n-- \(familyName) \n")
            for fontName in UIFont.fontNamesForFamilyName(familyName) {
                print(fontName)
            }
        }
    }
    
    
    func novoDisc(){
    
    
        var randomImagens = arc4random()%4
        randomImagens += 1
        
        let disc = SKSpriteNode(imageNamed: "birl_\(randomImagens)")
        disc.zPosition = 2
        disc.name = "discObjeto"
    
        let randomX = random(min: CGRectGetMinX(gameArea) + disc.size.width/2,
                             max: CGRectGetMaxX(gameArea) - disc.size.width/2)
        
        let randomY = random(min: CGRectGetMinY(gameArea) + disc.size.height/2,
                             max: CGRectGetMaxY(gameArea) - disc.size.height/2)
        
        disc.position = CGPoint(x: randomX, y: randomY)
        self.addChild(disc)
        
        disc.runAction(SKAction.sequence([
            
            SKAction.scaleTo(0, duration: 4.0),
            SKAction.runBlock(gameOver)
            
            
            ]))
    
    }
    
    
    func gameOver(){
    
    
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let sceneTransition = SKTransition.fadeWithDuration(0.1)
        self.view!.presentScene(sceneToMoveTo, transition: sceneTransition)
        
    }
    
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let positionOfTouch = touch.locationInNode(self)
            let tappedNode = nodeAtPoint(positionOfTouch)
            let nameOfTappedNode = tappedNode.name
            
            
            
            if nameOfTappedNode == "discObjeto" {
                
                tappedNode.name = ""
                
                tappedNode.removeAllActions()
                
                
                tappedNode.runAction(SKAction.sequence([
                    
                    SKAction.fadeOutWithDuration(0.2),
                    SKAction.removeFromParent()
                    
                    ]))
                
                
                switch scoreNumber {
                case 15 :
                    self.runAction(playAkiBody)
                case 37 :
                    self.runAction(play37)
                case 70 :
                    self.runAction(playEitaPorra)
                case 45 :
                    self.runAction(playAkiBody)
                case 80 :
                    self.runAction(playAkiBody)
                case 90 :
                    self.runAction(playEitaPorra)
                case 100 :
                    self.runAction(playAkiBody)
                case 110 :
                    self.runAction(playEitaPorra)
                case 120 :
                    self.runAction(playAkiBody)
                case 130 :
                    self.runAction(playAkiBody)
                case 16, 17, 38, 39, 71, 72, 51, 52, 81, 82, 46, 47, 91, 92, 111, 112, 121, 122, 131, 132: break
                    
                default:
                    self.runAction(playBirl)
                }
                
                
                
                
                
                novoDisc()
                scoreNumber += 1
                scoreLabel.text = "\(scoreNumber)"
                
                if scoreNumber == 10 || scoreNumber == 50 || scoreNumber == 125 || scoreNumber == 200
                    || scoreNumber == 300 || scoreNumber == 500{
                    
                    
                
                    novoDisc()
                }
            
            }
            
            
        }
        
        
    }



}
