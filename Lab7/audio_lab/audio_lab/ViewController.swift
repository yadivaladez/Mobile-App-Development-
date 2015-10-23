//
//  ViewController.swift
//  audio_lab
//
//  Created by Yadira Valadez on 10/22/15.
//  Copyright (c) 2015 Yadira Valadez. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate,
AVAudioRecorderDelegate {
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    
    let fileName = "audio.caf"

    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
  
    
    @IBAction func recordAudio(sender: UIButton) {
     
        if audioRecorder?.recording == false{
            playButton.enabled = false
            stopButton.enabled = true
            audioRecorder?.record()
        }
    }
    
    @IBAction func playAudio(sender: UIButton) {
        
        if audioRecorder?.recording == false{
            stopButton.enabled = true
            recordButton.enabled = false
            var error: NSError?
            
            //create the AVAudioPlayer instance
            audioPlayer=AVAudioPlayer(contentsOfURL: audioRecorder?.url,
                error: &error)
            
            //test for error
            if let err = error {
                println("AVAudioPlayer error: \(err.localizedDescription)")
            } else {
                audioPlayer?.delegate=self
                audioPlayer?.play()             }
        }
    }
    
    @IBAction func stopAudio(sender: UIButton) {
        stopButton.enabled = false
        playButton.enabled = true
    
        recordButton.enabled = true
        //stop recording or playing
        if audioRecorder?.recording == true {
            audioRecorder?.stop()
        } else {
            audioPlayer?.stop()
        }
    }
    override func viewDidLoad() {
        playButton.enabled = false;
        stopButton.enabled = false;
        
        //get path for the audio file
        let dirPath =
        NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)
        let docDir = dirPath[0] as! String //
        let audioFilePath = docDir.stringByAppendingPathComponent(fileName)
        let audioFileURL = NSURL(fileURLWithPath: audioFilePath)
        
        let recordSettings = [AVEncoderAudioQualityKey:
            AVAudioQuality.Min.rawValue, AVEncoderBitRateKey: 16, AVNumberOfChannelsKey:
            2, AVSampleRateKey: 44100.0]
        
        var error : NSError?
        
        
        audioRecorder = AVAudioRecorder(URL: audioFileURL, settings:
            recordSettings as [NSObject : AnyObject], error: &error)
        
        
        if let err = error {
            println("AVAudioRecorder error: \(err.localizedDescription)")
        } else { //no error
            audioRecorder?.delegate = self
            audioRecorder?.prepareToRecord()
        }
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully
        flag: Bool) {
            recordButton.enabled = true
            stopButton.enabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

