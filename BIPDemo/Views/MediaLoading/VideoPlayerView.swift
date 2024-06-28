//
//  VideoPlayerView.swift
//  BIPDemo
//
//  Created by Micheal Bingham on 6/27/24.
//

import SwiftUI
import AVKit



struct VideoPlayerView: View {
    
    private var videoURL : URL
    @State private var player: AVPlayer?
    
    @State private var isMuted: Bool = true
    
    var showMuteButton: Bool
    
    init(url: URL, showMuteButton: Bool = true) {
        self.videoURL = url
        self.showMuteButton = showMuteButton
    }
    
    
    var body: some View {
        VideoPlayer(player: player)
        
            .onAppear() {
                Task {
                    player = AVPlayer()
                    await loadPlayerItem(self.videoURL)
                    
                    player?.isMuted = true
                    self.isMuted = player?.isMuted ?? false
                    
                    player?.play()
                    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                        self.player?.seek(to: .zero)
                        self.player?.play()
                    }
                }//: Task
            }//: onAppear
            .onDisappear() {
                Task {
                    // Stop the player when the view disappears
                    player?.pause()
                    
                }
            }
            .onChange(of: videoURL) { oldValue, newValue in
                Task {
                    await loadPlayerItem(newValue)
                    
                }
            }
            .overlay(alignment: .topTrailing) {
                if showMuteButton {
                    Image(systemName: isMuted ? "speaker.slash.fill" : "speaker.wave.2.fill")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(8)
                        .background(Color.gray.opacity(0.3))
                        .clipShape(Circle())
                        .padding()
                        .onTapGesture {
                            player?.isMuted.toggle()
                            self.isMuted = player?.isMuted ?? false
                        }
                }
            }
            
    }
    
    
    func loadPlayerItem(_ videoURL: URL) async {
        
        let asset = AVAsset(url: videoURL)
        do {
            let (_, _, _) = try await asset.load(.tracks, .duration, .preferredTransform)
        } catch let error {
            print(error.localizedDescription)
        }
        
        let item = AVPlayerItem(asset: asset)
        player?.replaceCurrentItem(with: item)
        
    }
}






#Preview {
    VideoPlayerView(url: URL(string:"http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4")!)
}
