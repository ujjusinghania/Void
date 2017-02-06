//
//  QuoteViewController.swift
//  Void
//
//  Created by Ujjwal Singhania on 2/5/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var pressAnywhereLabel: UILabel!
    @IBOutlet weak var quoteLabel: UILabel!
    var letterAppearer: Timer!
    var quoteKeeper: String = "The void is now open. Here, no one else can hear you. Here, you can speak your mind freely. What is said in the void, stays there."
    var letterCounter: String.Index!
    
    func updateQuote() {
        if (letterCounter == quoteKeeper.endIndex) {
            letterAppearer.invalidate()
            pressAnywhereLabel.text = "Touch Anywhere To Continue"
            return
        }
        quoteLabel.text = quoteLabel.text! + String(quoteKeeper[letterCounter])
        letterCounter = quoteKeeper.index(after: letterCounter)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        quoteLabel.textColor = UIColor.white
        letterCounter = quoteKeeper.startIndex
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        letterAppearer = Timer.scheduledTimer(timeInterval: 0.03, target: self, selector: #selector(self.updateQuote), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
