//
//  IntroViewController.swift
//  Carousel-Prototype
//
//  Created by Wong, Kapunahele on 4/8/16.
//  Copyright © 2016 Wong, Kapunahele. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var IntroScrollView: UIScrollView!
    @IBOutlet weak var cabinTile: UIImageView!
    @IBOutlet weak var ladyTile: UIImageView!
    @IBOutlet weak var fishTile: UIImageView!
    @IBOutlet weak var bunnyEars: UIImageView!
    @IBOutlet weak var lochNessTile: UIImageView!
    @IBOutlet weak var deerTile: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IntroScrollView.contentSize = CGSize(width: 320, height: 1200)
        IntroScrollView.delegate = self
        self.navigationController?.navigationBarHidden = true
        
        cabinTile.transform = CGAffineTransformMakeScale(2, 2)
        cabinTile.transform = CGAffineTransformRotate(cabinTile.transform, 22/180)
        cabinTile.transform = CGAffineTransformTranslate(cabinTile.transform, 10, 0)
        
        ladyTile.transform = CGAffineTransformMakeScale(1.5, 1.5)
        ladyTile.transform = CGAffineTransformRotate(ladyTile.transform, -20/180)
        ladyTile.transform = CGAffineTransformTranslate(ladyTile.transform, -8, 0)
        
        fishTile.transform = CGAffineTransformMakeScale(1.5, 1.5)
        fishTile.transform = CGAffineTransformRotate(fishTile.transform, 40/180)
        fishTile.transform = CGAffineTransformTranslate(fishTile.transform, -5, 0)
        
        bunnyEars.transform = CGAffineTransformMakeRotation(-28/180)
//        bunnyEars.transform = CGAffineTransformMakeScale(1, 1)
//        bunnyEars.transform = CGAffineTransformRotate(cabinTile.transform, 22/180)
        
        lochNessTile.transform = CGAffineTransformMakeScale(2, 2)
        lochNessTile.transform = CGAffineTransformRotate(lochNessTile.transform, 22/180)
        lochNessTile.transform = CGAffineTransformTranslate(lochNessTile.transform, 0, -10)
        
        deerTile.transform = CGAffineTransformMakeScale(1.5, 1.5)
        deerTile.transform = CGAffineTransformRotate(deerTile.transform, -22/180)
        deerTile.transform = CGAffineTransformTranslate(deerTile.transform, 10, -25)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("hi, you scrolled")
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
