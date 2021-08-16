//
//  SoundManager.swift
//  sharex
//
//  Created by Amr Moussa on 01/08/2021.
//  Copyright © 2021 Amr Moussa. All rights reserved.
//


import AVFoundation

open class AMSoundManager{
    
    public static let shared = AMSoundManager()
    var player:AVAudioPlayer?
    private init (){}
    
    open func playMessageSound(){
        // add file.mp3 in in assets
        playSound(fileName: "recievedMessage", Ext: "mp3")
        

    }
    
    
    open func playSendSound(){
        // add file.mp3 in in assets
        playSound(fileName: "sendButton", Ext: "mp3")
    }
    
    private func playSound(fileName:String,Ext:String){
        // Load a local sound file
        guard let soundFile = Bundle.main.path(forResource: fileName, ofType: Ext)else{
            return
        }
        
        let soundFileURL = URL(fileURLWithPath: soundFile)
        do {
             player = try AVAudioPlayer(contentsOf: soundFileURL)
             player?.volume = 1.0
             player?.prepareToPlay()
             player?.play()
        }
        catch {
            // Handle error
            print("Error")
        }
    }
    
}
