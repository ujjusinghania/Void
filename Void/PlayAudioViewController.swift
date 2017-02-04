//
//  PlaySoundViewController.swift
//  Void
//
//  Created by Ujjwal Singhania on 2/3/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit
import AVFoundation

class PlayAudioViewController: UIViewController {
    
    var audioFileURL : NSURL!
    var recordedAudioFile: AVAudioRecorder!
    var soundPlay: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func playRecording(_ sender: AnyObject) {
        do {
            try soundPlay = AVAudioPlayer(contentsOf: audioFileURL! as URL)
        }
        catch {
            print("AVAudioRecorder can't play the file.")
        }
        soundPlay.volume = 1.0
        soundPlay.prepareToPlay()
        soundPlay.play()
    }
    
    @IBAction func pauseRecording(_ sender: AnyObject) {
        soundPlay.stop()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteUserInputs(_ sender: AnyObject) {
        try! recordedAudioFile = AVAudioRecorder(url: audioFileURL! as URL, settings: [:])
        recordedAudioFile.deleteRecording()
    }
    

}
