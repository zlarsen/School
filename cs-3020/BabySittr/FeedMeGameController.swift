

import UIKit
import SpriteKit

class FeedMeGameController: UIViewController {
    
    let scene = FeedMeGameScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = false
        skView.showsNodeCount = false
        skView.ignoresSiblingOrder = true
        
        // Create and configure the scene.
        let scene = FeedMeGameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Present the scene.
        skView.presentScene(scene)
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBarHidden = false
    }

    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return UIInterfaceOrientationMask.Portrait
        } else {
            return UIInterfaceOrientationMask.PortraitUpsideDown
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillAppear(animated)
        scene.stopAudio()
        
        
    }
}
