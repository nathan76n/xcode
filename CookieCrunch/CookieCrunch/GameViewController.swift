//
//  GameViewController.swift
//  CookieCrunch
//
//  Created by Matthijs on 19-06-14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    // The scene draws the tiles and cookie sprites, and handles swipes.
    var scene: GameScene!
    
    var movesLeft = 0
    var score = 0
    
    var tapGestureRecognizer: UITapGestureRecognizer!
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var movesLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var gameOverPanel: UIImageView!
    
    // The level contains the tiles, the cookies, and most of the gameplay logic.
    // Needs to be ! because it's not set in init() but in viewDidLoad().
    var level: Level!
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    
    override func supportedInterfaceOrientations() -> Int {
        return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as SKView
        skView.multipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .AspectFill
        
        // Load the level.
        level = Level(filename: "Level_1")
        scene.level = level
        scene.addTiles()
        scene.swipeHandler = handleSwipe
        
        gameOverPanel.hidden = true
        
        // Present the scene.
        skView.presentScene(scene)
        
        // Let's start the game!
        beginGame()
    }
    
    func beginGame() {
        movesLeft = level.maximumMoves
        score = 0
        updateLabels()
        level.resetComboMultiplier()
        shuffle()
    }
    
    func shuffle() {
        // Fill up the level with new cookies, and create sprites for them.
        let newCookies = level.shuffle()
        scene.addSpritesForCookies(newCookies)
    }
    
    // This is the swipe handler. MyScene invokes this function whenever it
    // detects that the player performs a swipe.
    func handleSwipe(swap: Swap) {
        // While cookies are being matched and new cookies fall down to fill up
        // the holes, we don't want the player to tap on anything.
        view.userInteractionEnabled = false
        
        if level.isPossibleSwap(swap) {
            level.performSwap(swap)
            scene.animateSwap(swap, completion: handleMatches)
        } else {
            scene.animateInvalidSwap(swap) {
                self.view.userInteractionEnabled = true
            }
        }
    }
    
    func updateLabels() {
        targetLabel.text = NSString(format: "%ld", level.targetScore)
        movesLabel.text = NSString(format: "%ld", movesLeft)
        scoreLabel.text = NSString(format: "%ld", score)
    }
    
    func handleMatches() {
        let chains = level.removeMatches()
        
        if chains.count == 0 {
            beginNextTurn()
            return
        }
        scene.animateMatchedCookies(chains) {
            for chain in chains {
                self.score += chain.score
            }
            self.updateLabels()
            let columns = self.level.fillHoles()
            self.scene.animateFallingCookies(columns) {
                let columns = self.level.topUpCookies()
                self.scene.animateNewCookies(columns) {
                    self.handleMatches()
                }
            }
        }
    }
    
    func beginNextTurn() {
        level.resetComboMultiplier()
        level.detectPossibleSwaps()
        decrementMoves()
        view.userInteractionEnabled = true
    }
    
    func decrementMoves() {
        --movesLeft
        updateLabels()
        
        if score >= level.targetScore {
            gameOverPanel.image = UIImage(named: "LevelComplete")
            showGameOver()
        } else if movesLeft == 0 {
            gameOverPanel.image = UIImage(named: "GameOver")
            showGameOver()
        }
    }
    
    func showGameOver() {
        gameOverPanel.hidden = false
        scene.userInteractionEnabled = false
        
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "hideGameOver")
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    func hideGameOver() {
        view.removeGestureRecognizer(tapGestureRecognizer)
        tapGestureRecognizer = nil
        
        gameOverPanel.hidden = true
        scene.userInteractionEnabled = true
        
        beginGame()
    }
}
