//
//  FullPostViewController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 13.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import UIKit
import Alamofire
import Unbox

class FullPostViewController: UIViewController {
    var id: Int = 0
    var postMarks: [Post] = []
    var post: Post = Post()
    let markPath = "mark"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var fullPostText: UILabel!
    

    func updateFullPostView() {
        let path: [String] = [String(id)]
        let postURL = mainURL.withAdditionalPath(path: path)
        
    }
    @IBOutlet weak var postMarksStack: UIStackView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postText: UILabel!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
