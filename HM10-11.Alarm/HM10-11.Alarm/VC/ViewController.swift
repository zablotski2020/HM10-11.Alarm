//
//  ViewController.swift
//  HM10-11.Alarm
//
//  Created by Ilya . on 24.01.22.
//

import AVFoundation
import UIKit
class ViewController: UIViewController {
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        playBackgroundVideo()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func unwindToViewController(_ unwindSegue: UIStoryboardSegue) {
//        let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
    }

    func playBackgroundVideo() {
        let path: String?
        path = Bundle.main.path(forResource: "MoonVideo", ofType: ".mp4")
        player = AVPlayer(url: URL(fileURLWithPath: path!))
        player!.actionAtItemEnd = AVPlayer.ActionAtItemEnd.none
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = view.frame
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        view.layer.insertSublayer(playerLayer, at: 0)
        NotificationCenter.default.addObserver(self, selector: #selector(playerItemDidReachEnd), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player!.currentItem)
        player!.seek(to: CMTime.zero)
        player!.play()
        player?.isMuted = true
    }

    @objc func playerItemDidReachEnd() {
        player!.seek(to: CMTime.zero)
    }
}
