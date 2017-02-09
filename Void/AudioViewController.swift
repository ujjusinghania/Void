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
    
    @IBOutlet weak var startRecording: UIButton!
    @IBOutlet weak var stopRecording: UIButton!
    @IBOutlet weak var resetRecording: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    var audioRecord: AVAudioRecorder!
    var timeKeeper: Timer!
    var seconds: Int! = 0
    var minutes: Int! = 0
    var hours: Int! = 0
    var filePath: URL!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        startRecording.isEnabled = true
        stopRecording.isEnabled = false
        resetRecording.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func resetViewController(_ sender: AnyObject) {
        seconds = 0
        minutes = 0
        hours = 0
        timeLabel.text = getTimeLabel()
        try! audioRecord = AVAudioRecorder(url: filePath, settings: [:])
        audioRecord.deleteRecording()
        resetRecording.isEnabled = false
        startRecording.isEnabled = true
    }
    
    func fixTime() {
        if (seconds == 60) {
            seconds = seconds - 60
            minutes = minutes + 1
            
        }
        if (minutes == 60) {
            minutes = minutes - 60
            hours = hours + 1
            
        }
    }
    
    func getTimeLabel() -> String {
        var label: String = ""
        if (hours < 10) {
            label = label + "0" + String(hours) + ":"
        }
        else {
            label = label + String(hours) + ":"
        }
        if (minutes < 10) {
            label = label + "0" + String(minutes) + ":"
        }
        else {
            label = label + String(minutes) + ":"
        }
        if (seconds < 10) {
            label = label + "0" + String(seconds)
        }
        else {
            label = label + String(seconds)
        }
        return label
    }
    
    func updateTimeLabel() {
        seconds = seconds + 1
        fixTime()
        timeLabel.text = getTimeLabel()
    }
    
    @IBAction func startRecording(sender: AnyObject) {
        
        startRecording.isEnabled = false
        
        let directoryPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
        let audioFileName = "voice.wav"
        let pathToFile = URL(string: directoryPath + "/" + audioFileName)
        filePath = pathToFile
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecord = AVAudioRecorder(url: pathToFile!, settings: [:])
        audioRecord.delegate = self
        audioRecord.prepareToRecord()
        audioRecord.record()
        
        timeKeeper = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimeLabel), userInfo: nil, repeats: true)
        
        stopRecording.isEnabled = true
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        audioRecord.stop()
        timeKeeper.invalidate()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        resetRecording.isEnabled = true
        stopRecording.isEnabled = false
        try! audioRecord = AVAudioRecorder(url: filePath! as URL, settings: [:])
        audioRecord.deleteRecording()
    }
}
