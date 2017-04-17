//
//  TweetsViewController.swift
//  Twitter
//
//  Created by Pari, Nithya on 4/17/17.
//  Copyright © 2017 Pari, Nithya. All rights reserved.
//

import UIKit

class TweetsViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tweetsTableView: UITableView!
    
    var tweets : [Tweet] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tweetsTableView.dataSource = self
        tweetsTableView.rowHeight = UITableViewAutomaticDimension
        tweetsTableView.estimatedRowHeight = 120
        TwitterClient.sharedInstance?.homeTimeline(success: { (tweets:[Tweet]) in
            self.tweets = tweets
            self.tweetsTableView.reloadData()
            }, failure: { (error: Error) in
                
        })
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tweets.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tweetCell = self.tweetsTableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCell
        tweetCell.tweet = self.tweets[indexPath.row]
        return tweetCell
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
