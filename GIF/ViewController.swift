//
//  ViewController.swift
//  GIF
//
//  Created by Ben LOWRY on 1/27/17.
//  Copyright © 2017 Ben LOWRY. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //our scroll view for viewing GIFs
    @IBOutlet weak var scrollView: UIScrollView!
    
    //to be used to store GIF file names
    var GIFFileArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //initialize the array of GIF file names
        //add the names of the GIFs you want to show
        GIFFileArray = ["giphy", "giphy2"]
        
        //loop through each GIF file in the array
        for GIFFileName in GIFFileArray {
            
            //create a new image view
            let imageView = UIImageView()
            //load GIF onto image view
            imageView.loadGif(name: GIFFileName)
            //make the GIF fit the width of the screen, without altering height
            imageView.contentMode = .scaleAspectFit
            
            //find the index of the file name in the array
            let index = CGFloat(GIFFileArray.index(of: GIFFileName)!)
            
            //find the x-coordinate that the GIF will be at in the scrollView
            //e.g. GIF 1 at x = 0, GIF 2 at x = 360, GIF 3 at x = 720, etc.
            let xPosition = view.frame.width * index
            
            //set the image view to reside at that xPosition, and to fit the screen
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            
            //make the content view large enough to fit all of the GIFs
            scrollView.contentSize.width = scrollView.frame.width * (index + 1)
            //add the GIF to the scroll view so we can see it
            scrollView.addSubview(imageView)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

