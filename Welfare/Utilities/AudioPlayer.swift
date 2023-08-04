//
//  AudioPlayer.swift
//  Welfare
//
//  Created by Paola Golombieski Ciarcia on 04/08/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(audio: String?, type: String?) {
    if let path = Bundle.main.path(forResource: audio, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the audio sound")
        }
    }

}
