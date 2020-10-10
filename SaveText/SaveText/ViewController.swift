//
//  ViewController.swift
//  SaveText
//
//  Created by miyazawaryohei on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView1: UITextView!
    @IBOutlet var textView2: UITextView!
    
    //テキストファイルのバス
    let thePath = NSHomeDirectory() + "/Documents/myTextfile.txt"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func saveToFile(_ sender: Any) {
        //キーボードを下げる
        view.endEditing(true)
        //保存するテキストデータ
        let textData = textView1.text
        //テキストデータの保存をトライする
        do{
            try textData?.write(toFile: thePath, atomically: true, encoding: String.Encoding.utf8)
        }catch let error as NSError {
            print("保存に失敗。\n \(error)")
        }
    }
    
    
    @IBAction func readFromFile(_ sender: Any) {
        //テキストデータの読み込むをトライする
        do {
            let textData = try String(contentsOfFile: thePath, encoding: String.Encoding.utf8)
            //読み込むが成功したならば表示する
            textView2.text = textData
            
        }catch let error as NSError {
            textView2.text = "読み込む失敗。\n \(error)"
        }
    }
}

