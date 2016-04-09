//
//  TutorialViewController.swift
//  Carousel-Prototype
//
//  Created by Wong, Kapunahele on 4/9/16.
//  Copyright © 2016 Wong, Kapunahele. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var swipeDots: UIPageControl!
    
    @IBOutlet weak var buttonParentView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        scrollView.contentSize = CGSize(width: 1280, height: 568)
        scrollView.delegate = self
        swipeDots.numberOfPages = 4
        buttonParentView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        swipeDots.currentPage = page
        
        if swipeDots.currentPage == 3 {
            swipeDots.hidden = true
            
            buttonParentView.alpha = 1
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
