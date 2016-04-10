//
//  LoginViewController.swift
//  Carousel-Prototype
//
//  Created by Wong, Kapunahele on 4/8/16.
//  Copyright © 2016 Wong, Kapunahele. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var signInNavBar: UIImageView!
    @IBOutlet weak var fieldParentView: UIView!
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var loginIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        loginScrollView.contentSize = CGSize(width: 320, height: 1200)
        loginScrollView.delegate = self
        loginScrollView.contentSize = loginScrollView.frame.size
        loginScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -120
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        // Set initial transform values 20% of original size
        let transform = CGAffineTransformMakeScale(0.2, 0.2)
        // Apply the transform properties of the views
        signInNavBar.transform = transform
        fieldParentView.transform = transform
        // Set the alpha properties of the views to transparent
        signInNavBar.alpha = 0
        fieldParentView.alpha = 0
    }
    
    override func viewDidAppear(animated: Bool) {
        //Animate the code within over 0.3 seconds...
        UIView.animateWithDuration(0.3) { () -> Void in
            // Return the views transform properties to their default states.
            self.fieldParentView.transform = CGAffineTransformIdentity
            self.signInNavBar.transform = CGAffineTransformIdentity
            // Set the alpha properties of the views to fully opaque
            self.fieldParentView.alpha = 1
            self.signInNavBar.alpha = 1
        }
    }
    
    func keyboardWillShow(notification: NSNotification!) {
        print("keyboardWillShow")
        // Move the button up above keyboard
        buttonParentView.frame.origin.y = buttonInitialY + buttonOffset
        // Scroll the scrollview up
        loginScrollView.contentOffset.y = loginScrollView.contentInset.bottom
    }
    
    func keyboardWillHide(notification: NSNotification!) {
        // Move the buttons back down to it's original position
        buttonParentView.frame.origin.y = buttonInitialY
    }
    
    @IBAction func didPressLogin(sender: AnyObject) {
        loginIndicator.startAnimating()
        loginButton.selected = true
        
        
        if emailField.text == "username" && passwordField.text == "password" {
            print("Email and Password Good to Go")
            let signingIn = UIAlertController(title: "Signing in... ", message: nil, preferredStyle: .Alert)
            presentViewController(signingIn, animated: true) {
            }
            delay(2, closure: { () -> () in
                signingIn.dismissViewControllerAnimated(true, completion: { () -> Void in
                    print("closed")
                })
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
                self.performSegueWithIdentifier("loginSegue", sender: nil)

            })

        } else if emailField.text!.isEmpty {
            let alertController = UIAlertController(title: "Email is Required", message: "Please enter your email", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in}
            alertController.addAction(cancelAction)
            
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
            })
            presentViewController(alertController, animated: true) {
            }
        } else if passwordField.text!.isEmpty {
            print("Password check failed")
            let alertController = UIAlertController(title: "Password Required", message: "Please enter your password", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "OK", style: .Cancel) { (action) in
                
            }
            alertController.addAction(cancelAction)
            
            delay(2, closure: { () -> () in
                self.loginIndicator.stopAnimating()
                self.loginButton.selected = false
            })
            presentViewController(alertController, animated: true) {
            }
        }
        
        
        else {
            print("got to else in didPressLogin")
        }
        
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
