//
//  TweetsViewController.swift
//  tweet_ios
//
//  Created by 矢野大輝 on 2017/10/22.
//  Copyright © 2017年 矢野大輝. All rights reserved.
//

import Foundation
import UIKit

class TweetsViewController: UITableViewController {
    
    // ダミーデータ
    private var tweets:[Tweet] = [Tweet(title: "むにゃむにゃ", body: "hogehoge"),
                                  Tweet(title: "ほげほげ", body: "fooooo"),
                                  Tweet(title: "ふが", body: "barbar"),
                                  Tweet(title: "ひろき", body: "barbar"),
                                  Tweet(title: "げほ", body: "barbar"),
                                  Tweet(title: "がーがー", body: "barbar"),
                                  Tweet(title: "まんじ", body: "barbar"),
                                  Tweet(title: "まじ", body: "barbar"),
                                  Tweet(title: "まんじ", body: "barbar"),
                                  Tweet(title: "たすけて", body: "barbar"),
                                  Tweet(title: "すき", body: "barbar"),]
    var speachLast = ""
    override func viewDidLoad() {
//        print(speachLast)
    }
    
    func numberOfSectionsInTableView(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let tweet = tweets[indexPath.row]
        cell.textLabel?.text = tweet.title
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let memo = Memo()
                memo.text = speachLast
                StockMemos.postMemo(memo: memo)
                let tweet = tweets[indexPath.row]
                let controller = segue.destination as! TweetDetailViewController
                controller.tweet = tweet
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

}
