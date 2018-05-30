//
//  VideoCutter.swift
//  swiftTest11_VideoBackground
//
//  Created by 李俊成 on 2018/5/15.
//  Copyright © 2018年 李俊成. All rights reserved.
//
import UIKit
import AVFoundation
extension String {
    var convert : NSString{
        return(self as NSString)
    }
}
open class VideoCutter:NSObject {
    open func cropVideoWithUrl(videoUrl url: URL,startTime: CGFloat, duration: CGFloat,completion:((_ videoPath: URL?, _ error:NSError?)-> Void)?) {
        let priority = DispatchQueue.GlobalQueuePriority.default
        DispatchQueue.global(priority: priority).async {
            let asset = AVURLAsset(url: url, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            let paths : NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory
                , .userDomainMask, true) as NSArray
            var outputURl = paths.object(at: 0) as! String
            let manager = FileManager.default
            do {
                try manager.createDirectory(atPath: outputURl, withIntermediateDirectories: true, attributes: nil)
            } catch _{
            }
            outputURl = outputURl.convert.appendingPathComponent("output.mp4")
            do{
                try manager.removeItem(atPath: outputURl)
            }catch _{
                
            }
            if let exportSession = exportSession as AVAssetExportSession?{
                exportSession.outputURL = URL(fileURLWithPath: outputURl)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileType.mp4 // AVFileTypeMPEG4
                let start = CMTimeMakeWithSeconds(Float64(startTime),600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), 600)
                let range = CMTimeRangeMake(start, duration)
                exportSession.timeRange = range
                exportSession.exportAsynchronously { ()-> Void in
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL,nil)
                    case AVAssetExportSessionStatus.failed:
                        print("Failed:\(exportSession.error)")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed:\(exportSession.error)")
                    default:
                        print("default case")
                    }
                }
            }
        }
    }
}






































