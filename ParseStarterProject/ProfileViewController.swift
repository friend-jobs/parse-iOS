//
//  ProfileViewController.swift
//  atnow-iOS
//
//  Created by Ben Ribovich on 11/7/15.
//  Copyright © 2015 Parse. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var userFullNameLabel: UILabel!
    
    @IBOutlet weak var starRatings: FloatRatingView!
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBOutlet weak var logoutButton: UIButton!
    
    let designHelper = DesignHelper()
    
    let imagePicker = UIImagePickerController()
    
    var user : PFUser? = PFUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        PFUser.currentUser()?.fetchInBackgroundWithBlock({ (response, error) -> Void in })
        if user?.username==nil{
            user = PFUser.currentUser()
        }
        userFullNameLabel.text = user!["fullName"] as! String!
        if user?["rating"] != nil {
            let rating = user!["rating"]
            starRatings.rating = user!["rating"]["rating"] as! Float!
        }
        
        let imageFromParse = user!.objectForKey("profilePicture") as? PFFile
        if(imageFromParse != nil){
            imageFromParse!.getDataInBackgroundWithBlock({ (imageData: NSData?, error: NSError?) -> Void in
                let image: UIImage! = UIImage(data: imageData!)!
                self.profilePicture.image = image
            })
        }
        
        
        designHelper.formatButton(logoutButton)
        designHelper.formatButton(editButton)
        designHelper.formatPicture(profilePicture)
        
    }
    
    @IBAction func editProfile(sender: AnyObject) {
        
    }
    
    @IBAction func changeProfilePicture(sender: UIButton) {
        let profileChangeMenu = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        self.imagePicker.allowsEditing = false
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default) { (action) in }
        let takePictureAction = UIAlertAction(title: "Take new picture", style: .Default) { (action) in
            self.imagePicker.sourceType = .Camera
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
        
        let libraryPictureAction = UIAlertAction(title: "Choose picture", style: .Default) { (action) in
            self.imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(self.imagePicker, animated: true, completion: nil)
        }
    
        profileChangeMenu.addAction(takePictureAction)
        profileChangeMenu.addAction(libraryPictureAction)
        profileChangeMenu.addAction(cancelAction)
        self.presentViewController(profileChangeMenu, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            profilePicture.contentMode = .ScaleAspectFit
            profilePicture.image = pickedImage
            designHelper.formatPicture(profilePicture)
            let imageData = UIImageJPEGRepresentation(pickedImage, 0.1)
            let imageFile = PFFile(name:"image.png", data: imageData!)
            self.user!["profilePicture"] = imageFile
            
            self.user?.saveInBackgroundWithBlock({ (succeeded, error) -> Void in
                if(succeeded == true){
                    //
                }
                else{
                    print(error)
                }
            })
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    @IBAction func signOutAction(sender: AnyObject) {
        // Send a request to log out a user
        PFUser.logOut()
        
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Login")
            self.presentViewController(viewController, animated: true, completion: nil)
        })
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
