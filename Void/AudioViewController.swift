//
//  ImageViewController.swift
//  Void
//
//  Created by Ujjwal Singhania on 2/2/17.
//  Copyright © 2017 Ujjwal Singhania. All rights reserved.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController, AVAudioRecorderDelegate {

    var audioRecord: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startRecording(sender: AnyObject) {
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
        let audioFileName = "voice.wav"
        let pathToFile = URL(string: directoryPath + "/" + audioFileName)
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecord = AVAudioRecorder(url: pathToFile!, settings: [:])
        audioRecord.delegate = self
        audioRecord.prepareToRecord()
        audioRecord.record()
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        audioRecord.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "PlayAudioViewSegue") {
            let destinationVC = segue.destination as! PlayAudioViewController
            destinationVC.audioFileURL = sender as! NSURL
        }
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if (flag) {
            performSegue(withIdentifier: "PlayAudioViewSegue", sender: audioRecord.url)
        }
    }

}
