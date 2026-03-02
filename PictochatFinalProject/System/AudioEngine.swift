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
    @Published var isPlaying = false
    @Published var currentTime: CMTime = CMTime.invalid
    var duration: TimeInterval? {
        player?.currentItem!.duration.seconds ?? 1
    }
    
    private var player: AVQueuePlayer?
    private var looper: AVPlayerLooper?
    private var timer: Timer?
    
    var logoAsset: AVURLAsset = AVURLAsset(url: .currentDirectory())
    var lobbyAsset: AVURLAsset = AVURLAsset(url: .currentDirectory())
    
    var volume: Float {
        get { player?.volume ?? 0.5 }
        set { player?.volume = newValue}
    }
    
    init() {
//        
//        do {
//            player = try AVAudioPlayer(contentsOf: url)
//            player?.prepareToPlay()
//        } catch {
//            print("Unable to load AVAudioPlayer!")
//        }
        guard let url = Bundle.main.url(forResource: "logo_jingle", withExtension: "mp3") else {
            print("Unable to find logo_jingle.mp3!")
            return
        }
        
        logoAsset = AVURLAsset(url: url)

        
        guard let url = Bundle.main.url(forResource: "lobby_bg", withExtension: "mp3") else {
            print("Unable to find lobby_bg.mp3!")
            return
        }
        
        lobbyAsset = AVURLAsset(url: url)
        
        let logoItem: AVPlayerItem = AVPlayerItem(asset: logoAsset),
            lobbyItem: AVPlayerItem = AVPlayerItem(asset: lobbyAsset)
        
        player = AVQueuePlayer()
        player?.insert(logoItem, after: nil)
        player?.insert(lobbyItem, after: nil)
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
    
    func loop() {
        looper = AVPlayerLooper(player: player!, templateItem: player!.currentItem!)
    }
    
    func next() {
        if (isPlaying) {
            while (player!.volume > 0) {
                player?.volume -= (1/60)
            }
        }
        
        pause()
        player?.advanceToNextItem()
        player?.preroll(atRate: player!.rate)
        play()
        
        while (player!.volume < 1) {
            player?.volume += (1/60)
        }
    }
    
    private func startTrackingTime() {
        if (timer != nil) {
            stopTrackingTime()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) {_ in
            self.currentTime = self.player?.currentItem!.currentTime() ?? CMTime(value: 0, timescale: 1)
        }
    }
    
    private func stopTrackingTime() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
            
        currentTime = CMTime(value: 0, timescale: 1)
    }
}
