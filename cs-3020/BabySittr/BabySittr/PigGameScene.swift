//
//  GameScene.swift
//  PigTown
//
//  Created by Zach Larsen on 4/18/16.
//  Copyright (c) 2016 Zach Larsen. All rights reserved.
//

import SpriteKit

enum ColliderType: UInt32 {
    case Animal = 1
    case Food = 2
}

class PigGameScene: SKScene, SKPhysicsContactDelegate {
    
    var counterLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
    var movingPig: Pig?
    var lastUpdateTime: NSTimeInterval = 0.0
    var dt: NSTimeInterval = 0.0
    var homeNode = SKNode()
    var foodNode = SKSpriteNode()
    var currentSpawnTime: NSTimeInterval = 5.0
    var gameOver = false
    let maxPigs = 10
    var numPigs = 0
    var savedPigs = 0
    var foodLvl = 2
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        if gameOver {
            restartGame()
        }
        
        let location = touches.first!.locationInNode(self)
        let node = nodeAtPoint(location)
        
        if node.name == "pig" {
            let pig = node as! Pig
            pig.clearWayPoints()
            pig.addMovingPoint(location)
            movingPig = pig
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let location = touches.first!.locationInNode(scene!)
        if let pig = movingPig {
            pig.addMovingPoint(location)
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        movingPig = nil
    }
    
    override func update(currentTime: CFTimeInterval) {
        if !gameOver {
            /* Called before each frame is rendered */
            dt = currentTime - lastUpdateTime
            lastUpdateTime = currentTime
            
            enumerateChildNodesWithName("pig", usingBlock: {node, stop in
                let pig = node as! Pig
                pig.move(self.dt)
                
            })
            if numPigs > self["pig"].count {
                savedPigs += numPigs - self["pig"].count
                print(savedPigs)
                numPigs = self["pig"].count
                counterLabel.text = "Pigs in the Barn: \(savedPigs)"
            }
            
            
            drawLines()
        }
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        physicsWorld.gravity = CGVectorMake(0.0,0.0)
        physicsWorld.contactDelegate = self
        loadLevel()
        spawnAnimal()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func drawLines() {
        //1
        enumerateChildNodesWithName("line", usingBlock: {node, stop in
            node.removeFromParent()
        })
        
        //2
        enumerateChildNodesWithName("pig", usingBlock: {node, stop in
            //3
            let pig = node as! Pig
            if let path = pig.createPathToMove() {
                let shapeNode = SKShapeNode()
                shapeNode.path = path
                shapeNode.name = "line"
                shapeNode.strokeColor = UIColor.grayColor()
                shapeNode.lineWidth = 2
                shapeNode.zPosition = 1
                
                self.addChild(shapeNode)
            }
        })
    }
    
    func loadLevel () {
        let bg = SKSpriteNode(imageNamed:"bg_2_grassy")
        bg.anchorPoint = CGPoint(x: 0, y: 0)
        addChild(bg)
        
        foodNode = SKSpriteNode(imageNamed:"trough_3_full")
        foodNode.name = "food"
        foodNode.position = CGPoint(x:size.width - 100, y:size.height - 200)
        foodNode.zPosition = 1
        
        foodNode.physicsBody = SKPhysicsBody(rectangleOfSize: foodNode.size)
        foodNode.physicsBody!.categoryBitMask = ColliderType.Food.rawValue
        foodNode.physicsBody!.dynamic = false
        
        addChild(foodNode)
        
        homeNode = SKSpriteNode(imageNamed: "barn")
        homeNode.name = "home"
        homeNode.position = CGPoint(x: size.width / 4.0, y: size.height-size.height + 100)
        homeNode.zPosition = 1
        addChild(homeNode)
        
        currentSpawnTime = 5.0
        
        
        counterLabel.text = "Pigs in the Barn: \(savedPigs)"
        counterLabel.name = "label"
        counterLabel.fontSize = 20.0
        counterLabel.position = CGPointMake(size.width / 2.0, size.height - 21.0)
        counterLabel.zPosition = 5
        addChild(counterLabel)
    }
    
    func spawnAnimal() {
        
        if gameOver {
            return
        }

        if currentSpawnTime < 1.0 {
            currentSpawnTime = 1.0
        }
        
        let pig = Pig(imageNamed: "pig_1")
        pig.position = CGPoint(x: size.width-100, y: size.height - CGFloat(arc4random_uniform(300)))
        pig.name = "pig"
        pig.zPosition = 1
        addChild(pig)
        numPigs += 1
        pig.moveRandom()
        runAction(SKAction.sequence([SKAction.waitForDuration(currentSpawnTime), SKAction.runBlock({
            self.spawnAnimal()
            }
            )]))
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        //1
        let firstNode = contact.bodyA.node
        let secondNode = contact.bodyB.node
        
        //2
        let collision = firstNode!.physicsBody!.categoryBitMask | secondNode!.physicsBody!.categoryBitMask
        
        //3
        if collision == ColliderType.Animal.rawValue | ColliderType.Animal.rawValue {
            //            handleAnimalCollision()
        } else if collision == ColliderType.Animal.rawValue | ColliderType.Food.rawValue {
            var pig: Pig!
            
            if firstNode!.name == "pig" {
                pig = firstNode as! Pig
                pig.eat()
                pigAteFood()
            } else {
                pig = secondNode as! Pig
                pig.eat()
                pigAteFood()
            }
        } else {
            NSLog("Error: Unknown collision category \(collision)")
        }
    }
    
    func pigAteFood() {
        if foodLvl == 2 {
            foodNode.texture = SKTexture(imageNamed:"trough_2")
            foodLvl = 1
        } else if foodLvl == 1 {
            foodNode.texture = SKTexture(imageNamed:"trough_1_empty")
            foodLvl = 0
        } else {
            foodNode.texture = SKTexture(imageNamed:"trough_3_full")
            foodLvl = 2
        }
    }
    
    func handleAnimalCollision() {
        gameOver = true
        
        let gameOverLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
        gameOverLabel.text = "Game Over!"
        gameOverLabel.name = "label"
        gameOverLabel.fontSize = 35.0
        gameOverLabel.position = CGPointMake(size.width / 2.0, size.height / 2.0 + 20.0)
        gameOverLabel.zPosition = 5
        
        let tapLabel = SKLabelNode(fontNamed: "Thonburi-Bold")
        tapLabel.text = "Tap to restart."
        tapLabel.name = "label"
        tapLabel.fontSize = 25.0
        tapLabel.position = CGPointMake(size.width / 2.0, size.height / 2.0 - 20.0)
        tapLabel.zPosition = 5
        
        addChild(gameOverLabel)
        addChild(tapLabel)
    }
    
    
    func restartGame() {
        enumerateChildNodesWithName("line", usingBlock: {node, stop in
            node.removeFromParent()
        })
        
        enumerateChildNodesWithName("pig", usingBlock: {node, stop in
            node.removeFromParent()
        })
        
        enumerateChildNodesWithName("label", usingBlock: {node, stop in
            node.removeFromParent()
        })
        
        currentSpawnTime = 5.0
        gameOver = false
        spawnAnimal()
    }
}
