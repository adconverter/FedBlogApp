//
//  PostsTableViewController.swift
//  FedBlogApp
//
//  Created by Руслан Федорович on 13.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import UIKit

class PostsTableViewController: UITableViewController {
    
    
    var posts: [Post] = []
    let refresh = UIRefreshControl()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updatePostsTableView()
        refresh.addTarget(self, action: #selector(PostsTableViewController.updatePostsTableView), for: UIControlEvents.valueChanged)
        tableView.refreshControl = refresh
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postPreviewCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        cell.detailTextLabel?.text = post.text
        return cell
    }
    
    @IBAction func exit(_ sender: Any) {
        logout({statusCode in
            guard statusCode == 200 else {
                return}
            self.performSegue(withIdentifier: "unwindToAuthorizationView", sender: self)
        })
        
    }
    
    @objc func updatePostsTableView() -> Void {
        fetchPosts(completionHandler: {posts in
            DispatchQueue.main.async {
                guard let posts = posts else {return}
                self.posts = posts
                self.tableView.reloadData()
                self.refresh.endRefreshing()
            }
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow, segue.identifier == "segueToFullPost", let fullPostViewController = segue.destination as? FullPostViewController else {return}
        fullPostViewController.id = posts[indexPath.row].id!
        fullPostViewController.updateFullPostView()
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
