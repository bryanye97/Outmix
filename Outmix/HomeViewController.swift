//
//  HomeViewController.swift
//  Outmix
//
//  Created by Bryan Ye on 26/06/2016.
//  Copyright © 2016 Bryan Ye. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController {
    
    var outfit: Outfit?
    
    var photoTakingHelper: PhotoTakingHelper?

    override func viewDidLoad() {
        super.viewDidLoad()
//        RealmHelper.deleteEverything()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "photoToLibrary" || segue.identifier == "homeToLibrary" {
            _ = segue.destinationViewController as! LibraryViewController
            
        }
    }
    
    @IBAction func getOutfit(sender: UIButton) {
        photoTakingHelper = PhotoTakingHelper(viewController: self, callback: { (image: UIImage?) in
            self.outfit = Outfit()
            self.outfit!.image = UIImageJPEGRepresentation(image!, 0.5)!
            
            RealmHelper.addOutfit(self.outfit!)
            
            self.performSegueWithIdentifier("photoToLibrary", sender: self)

        })
        

    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {
        
    }

    
    
    


}


