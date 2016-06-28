//
//  OutfitViewController.swift
//  Outmix
//
//  Created by Bryan Ye on 26/06/2016.
//  Copyright © 2016 Bryan Ye. All rights reserved.
//

import UIKit

class OutfitViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
//  var image = UIImage()
    
    var outfit: Outfit?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageView.image = UIImage(data:outfit!.image,scale:1.0)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "unwindToLibrary" {
            RealmHelper.deleteOutfit(outfit!)
            
        }
    }

    
    
    
    
}
