//
//  LibraryViewController.swift
//  Outmix
//
//  Created by Bryan Ye on 26/06/2016.
//  Copyright © 2016 Bryan Ye. All rights reserved.
//

import UIKit
import RealmSwift

class LibraryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var outfits: Results<Outfit>! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        outfits = RealmHelper.retrieveOutfits()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .redColor()

        outfits = RealmHelper.retrieveOutfits()
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return outfits.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CollectionViewCell
        
        let row = indexPath.row
        
        let outfit = outfits[row]
        
        cell.imageView.image = UIImage(data:outfit.image,scale:1.0)
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showImage", sender: self)
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showImage" {
            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
            let indexPath = indexPaths[0] as NSIndexPath
            
            let vc = segue.destinationViewController as! OutfitViewController
            let outfit = outfits[indexPath.row]
            vc.outfit = outfit
        }
    }
    
    @IBAction func unwindToLibrary(segue: UIStoryboardSegue) {
    }
    
   

}
