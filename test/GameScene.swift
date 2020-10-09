//
//  GameScene.swiftr
//  test
//
//  Created by Pavel Anischenko on 10/5/20.
//

import SpriteKit
import GameplayKit




class GameScene: SKScene{
    
    var SpaceShip: SKSpriteNode!
    
    override func didMove(to view: SKView){
        
        let SpaceBackground = SKSpriteNode(imageNamed: "spaceBackground")
        SpaceBackground.size = CGSize(width: UIScreen.main.bounds.width * 2.4, height: UIScreen.main.bounds.height * 2.4)
        addChild(SpaceBackground)
        
        
        SpaceShip = SKSpriteNode(imageNamed: "Ships")
        addChild(SpaceShip)
        
    }
   
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let touchLocation = touch.location(in: self)
            print (touchLocation)
            
            let moveAction = SKAction.move(to: touchLocation, duration: 0.5)
            SpaceShip.run(moveAction)
        }
        
    }
        func createAsteroid() -> SKSpriteNode{
            let asteroid = SKSpriteNode(imageNamed: "Asteroid")
            
            asteroid.position.x = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound:Int(frame.size.width)))
            asteroid.position.y = CGFloat(GKRandomSource.sharedRandom().nextInt(upperBound:Int(frame.size.height)))
            
            return asteroid
        }
        
        override func update(_ currentTime:TimeInterval){
        
        let asteroid = createAsteroid()
         addChild(asteroid)
        
        }
        
    
}


