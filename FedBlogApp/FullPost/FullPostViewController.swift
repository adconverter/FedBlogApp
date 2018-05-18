//
//  FullPostViewController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 13.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import UIKit


class FullPostViewController: UIViewController {
    var id: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updateFullPostView() {
        fetchFullPost(id: id, completionHandler: {post in
            guard let post = post else {return}
            self.fullPostText.text = post.text
            self.postTitle.text = post.title
            self.updateComments()
        })
        
        fetchMarks(id: id, completionHandler: {marks in
            guard let marks = marks else {print("Marks wasn't unwrapped")
                return}
            for mark in marks{
                let label = UILabel()
                label.text = mark.name
                label.textColor = UIColor.white
                label.backgroundColor = self.firstMarkLabel.backgroundColor
                self.postMarksStack.addArrangedSubview(label)
            }
        })
    }
    
    func clearView() {
        postTitle.text = ""
        postText.text = ""
        firstMarkLabel.isHidden = true
        allComments.text = ""
    }
    
    func updateComments() {
        fetchComments(id: id, completionHandler: { (comments) in
            guard let comments = comments else {return}
            var temporaryComments = ""
            self.allComments.text = ""
            for comment in comments {
                let commentString = """
                \(comment.datePublic!)
                \(comment.author!)
                \(comment.text!)
                
                
                """
                temporaryComments.insert(contentsOf: commentString, at: temporaryComments.startIndex)
            }
            self.allComments.text! = temporaryComments            
        })}
    
    
    @IBAction func commentOn(_ sender: Any) {
        guard let text = writtenComment.text else {return}
        
        submitComment(text: text, idPost: id, completionHandler: { (statusCode) in
            if statusCode == 200 {
                self.updateComments()
            }
        })
    }
    
    
    @IBOutlet weak var fullPostText: UILabel!
    @IBOutlet weak var postMarksStack: UIStackView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var firstMarkLabel: UILabel!
    @IBOutlet weak var writtenComment: UITextField!
    @IBOutlet weak var allComments: UILabel!
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
