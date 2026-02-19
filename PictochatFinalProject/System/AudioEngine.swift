//
//  AudioEngine.swift
//  PictochatFinalProject
//
//  Created by Jacob Martin on 2/18/26.
//
// Thanks to NDC on youtube
// and their tutorial on AVFoundation!

import AVFoundation
import SwiftUI
internal import Combine

final class AudioEngine: ObservableObject {
    @Published var soundPath: String? = .none
    @Published var isPlaying = false
    @Published var currentTime: TimeInterval = .zero
    
    private var player: AVAudioPlayer?
    private var timer: Timer?
    
    var duration: TimeInterval? {
        player?.duration ?? 1
    }
    
    var volume: Float {
        get { player?.volume ?? 0.5 }
        set { player?.volume = newValue}
    }
    
    init(soundPath: String?) {
        self.soundPath = soundPath ?? "logo_jingle"
        
        guard let url = Bundle.main.url(forResource: self.soundPath, withExtension: "mp3") else {
            print("Unable to find \(self.soundPath ?? "logo").mp3!")
            return;
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print("Unable to load AVAudioPlayer!")
        }
    }
    
    func changeToFile(_ filePath: String?, withExtension: String?) {
        if (isPlaying) {
            print("Cannot change file while playing!")
            return
        }
        
        soundPath = filePath ?? "NONE"
        
        if (player != nil) {
            player = nil
        }
        
        guard let url = Bundle.main.url(forResource: soundPath, withExtension: "mp3") else {
            print("Unable to find \(soundPath ?? "logo").mp3!")
            return;
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        } catch {
            print ("Unable to load new AVAudioPlayer!")
        }
    }
    
    func play() {
        player?.play()
        isPlaying = true
        startTrackingTime()
    }
    
    func pause() {
        player?.pause()
        isPlaying = false
        stopTrackingTime()
    }
    
    private func startTrackingTime() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) {_ in
            self.currentTime = self.player?.currentTime ?? 0
        }
    }
    
    private func stopTrackingTime() {
        if timer != nil {
            timer = nil
        }
            
        currentTime = 0.0
    }
}
