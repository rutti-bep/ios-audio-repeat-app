//
//  ViewController.swift
//  music-repeat-player
//
//  Created by 今野暁 on 2018/05/02.
//  Copyright © 2018年 rutti-bep. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, MPMediaPickerControllerDelegate {

    var player = MPMusicPlayerController.applicationMusicPlayer;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

/*    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  */
    @IBAction func pick(sender: AnyObject) {
        // MPMediaPickerControllerのインスタンスを作成
        let picker = MPMediaPickerController()
        // ピッカーのデリゲートを設定
        picker.delegate = self
        // 複数選択を不可にする。（trueにすると、複数選択できる）
        picker.allowsPickingMultipleItems = false
        // ピッカーを表示する
        self.present(picker, animated: true, completion: nil)
        
    }
    
    // メディアアイテムピッカーでアイテムを選択完了したときに呼び出される
    func mediaPicker(_ mediaPicker: MPMediaPickerController, didPickMediaItems mediaItemCollection: MPMediaItemCollection) {
        
        Swift.print(mediaItemCollection.items[0].assetURL);
        // 選択した曲情報がmediaItemCollectionに入っているので、これをplayerにセット。
        player.setQueue(with: mediaItemCollection)
        // 再生開始
        player.play()
        // ピッカーを閉じ、破棄する
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    //選択がキャンセルされた場合に呼ばれる
    func mediaPickerDidCancel(_ mediaPicker: MPMediaPickerController) {
        // ピッカーを閉じ、破棄する
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func pushPlay(sender: AnyObject) {
        player.play()
    }
    
    @IBAction func pushPause(sender: AnyObject) {
        player.pause()
    }
    
    @IBAction func pushStop(sender: AnyObject) {
        player.stop()
    }
}

