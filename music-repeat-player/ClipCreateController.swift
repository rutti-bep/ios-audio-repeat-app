//
//  ClipCreateController.swift
//  music-repeat-player
//
//  Created by 今野暁 on 2018/05/03.
//  Copyright © 2018年 rutti-bep. All rights reserved.
//

import Foundation
import MediaPlayer

class ClipCreateController: UIViewController{
    static let sharedInstance = ClipCreateController();
    
    func showMusicWaveView (musicUrl: URL){
        let asset = AVAsset(url: musicUrl);
        let assetReader = try! AVAssetReader(asset: asset);
        let audioTrack = asset.tracks[0];
        let assetReaderTrackOutput = AVAssetReaderTrackOutput(track: audioTrack, outputSettings: nil);
        let musicFullData:NSMutableData = NSMutableData();
        
        assetReader.add(assetReaderTrackOutput);
        assetReader.startReading();
        
        while (assetReader.status == AVAssetReaderStatus.reading){
            let trackOutput = assetReader.outputs[0];
            let sampleBufferRef = trackOutput.copyNextSampleBuffer();
            if (sampleBufferRef != nil){
                let blockBufferRef = CMSampleBufferGetDataBuffer(sampleBufferRef!);
                let bufferLength = CMBlockBufferGetDataLength(blockBufferRef!);
                let data = NSMutableData(length: bufferLength);
                
                CMBlockBufferCopyDataBytes(blockBufferRef!, 0, bufferLength, data!.mutableBytes);
                
                musicFullData.append(data! as Data);
                CMSampleBufferInvalidate(sampleBufferRef!)
            }
        }
        
        Swift.print(musicFullData);
        
        //Swift.print(asset);
        //Swift.print(assetReader);
    }
    
}
