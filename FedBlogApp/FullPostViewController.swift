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
    }
    
    @IBOutlet weak var fullPostText: UILabel!
    @IBOutlet weak var postMarksStack: UIStackView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UILabel!
    @IBOutlet weak var firstMarkLabel: UILabel!
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
