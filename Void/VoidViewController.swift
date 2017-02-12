//
//  VoidViewController.swift
//  Void
//
//  Created by Ujjwal Singhania on 2/3/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit

class VoidViewController: UIViewController {
    
    // Animation Global Variables
    
    @IBOutlet weak var nextViewButton: UIButton!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var pressAnywhereLabel: UILabel!
    @IBOutlet weak var blackHoleAnimateImageView: UIImageView!
    var triangleAnimateImageCount: Int = 1
    var animationCounter: Int = 1
    var animationTimeKeeper: Timer!
    
    // Quote Global Variables
    
    var quoteLibrary: [String] = ["All our dreams can come true if we have the courage to pursue them. - Walt Disney",
        "Someone is sitting in the shade today because someone planted a tree a long time ago. - Warren Buffett",
        "You only live once, but if you do it right, once is enough. - Mae West.",
        "The difference between winning and losing is most often not quitting. - Walt Disney.",
        "I have not failed. I've just found 10,000 ways that won't work. - Thomas Edison.",
        "You miss 100 percent of the shots you don't take. - Wayne Gretzky.",
        "You can't please everyone, and you can't make everyone like you. - Katie Couric.",
        "Don't worry about failure; you only have to be right once. - Drew Houston.",
        "Everything you can imagine is real. - Pablo Picasso.",
        "Be yourself. Everyone else is already taken. - Oscar Wilde.",
        "If you don’t build your dream, someone else will hire you to help them build theirs. - Dhirubhai Ambani.",
        "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb.",
        "Everything you’ve ever wanted is on the other side of fear. - George Addair.",
        "In order to succeed, your desire for success should be greater than your fear of failure. - Bill Cosby.",
        "Screw it, let’s do it! - Richard Branson.",
        "Your time is limited, so don’t waste it living someone else’s life. – Steve Jobs.",
        "The Way Get Started Is To Quit Talking And Begin Doing. - Walt Disney.",
        "Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.  – Robert Frost.",
        "You can never cross the ocean until you have the courage to lose sight of the shore. – Christopher Columbus.",
        "The only person you are destined to become is the person you decide to be. – Ralph Waldo Emerson.",
        "Believe you can and you’re halfway there. – Theodore Roosevelt.",
        "Our lives begin to end the day we become silent about things that matter. – Martin Luther King Jr.",
        "The only way to do great work is to love what you do. – Steve Jobs.",
        "Nothing is impossible, the word itself says, “I’m possible!” – Audrey Hepburn."]
    var currentQuote: String!
    var quoteTimer: String!
    var letterCounter: String.Index!
    
    func animateView() {
        animationCounter = animationCounter + 1
        if (animationCounter == 2) {
            animateBlackHole()
        }
        if (animationCounter == 5) {
            blackHoleAnimateImageView.stopAnimating()
            blackHoleAnimateImageView.image = #imageLiteral(resourceName: "Background Starry")
            animationTimeKeeper.invalidate()
            animationTimeKeeper = Timer.scheduledTimer(timeInterval: 0.025, target: self, selector: #selector(self.quoteAppear), userInfo: nil, repeats: true)
        }
    }
    
    func animateBlackHole() {
        var blackHoleAnimateImageArray = [UIImage]()
        
        for pictureNumber in 6...47
        {
            let imageName : String = "VoidGIF-\(pictureNumber).png"
            let image  = UIImage(named:imageName)
            blackHoleAnimateImageArray.append(image!)
        }
        
        blackHoleAnimateImageArray.append(#imageLiteral(resourceName: "Background Starry"))
        
        blackHoleAnimateImageView.animationImages = blackHoleAnimateImageArray
        blackHoleAnimateImageView.animationDuration = 2.6
        blackHoleAnimateImageView.startAnimating()
    }
    
    
    func quoteAppear() {
        if (letterCounter == currentQuote.endIndex) {
            animationTimeKeeper.invalidate()
            pressAnywhereLabel.text = "Touch Anywhere to Continue"
            nextViewButton.isEnabled = true
            return
        }
        quoteLabel.text = quoteLabel.text! + String(currentQuote[letterCounter])
        letterCounter = currentQuote.index(after: letterCounter)
    }
    
    func randomQuoteAssign() {
        let index: Int! = Int(arc4random()) % quoteLibrary.count
        currentQuote = quoteLibrary[index]
        letterCounter = currentQuote.startIndex
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        randomQuoteAssign()
        animationTimeKeeper = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
