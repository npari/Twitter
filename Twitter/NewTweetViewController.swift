//
//  NewTweetViewController.swift
//  Twitter
//
//  Created by Pari, Nithya on 4/17/17.
//  Copyright © 2017 Pari, Nithya. All rights reserved.
//

import UIKit


class NewTweetViewController: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var tweetComposeView: UITextView!
    var user: User!
    var inReplyToStatus: Tweet?
    var inReplyToUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = User.currentUser {
            profileImage.setImageWith(user.profileUrl as! URL)
            name.text = user.name
            username.text = "@"+user.screenname!
        }
        if let inReplyToUser = inReplyToUser {
            tweetComposeView.text = "@" + inReplyToUser.screenname!
        }
        tweetComposeView.becomeFirstResponder()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onCancel(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func onTweet(_ sender: AnyObject) {
        let twitterClient = TwitterClient.sharedInstance
        let tweetText = self.tweetComposeView.text
        twitterClient?.tweet(tweetText: tweetText!, inResponseToTweet: self.inReplyToStatus, success: { (tweet: Tweet) in
            print("Successful tweet \(tweet.text)")
            }, failure: { (error: Error) in
                print(error.localizedDescription)
        })
        self.dismiss(animated: true, completion: nil)
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
