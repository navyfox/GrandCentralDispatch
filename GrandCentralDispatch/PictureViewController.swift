//
//  PictureViewController.swift
//  GrandCentralDispatch
//
//  Created by Игорь Михайлович Ракитянский on 10.08.16.
//  Copyright © 2016 RIM. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var imageURL: NSURL?
    var image: UIImage? {
        get {return imageView.image}
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.hidden = true
        }
    }

    func fetchImage() {
        imageURL = NSURL(string: "https://wallpaperscraft.ru/image/braziliya_rio_de_zhaneyro_statuya_hrista_spasitelya_brazil_rio_de_janeiro_christ_the_redeemer_vid_sverhu_25377_3840x2160.jpg")

        if let url = imageURL {
            self.activityIndicator.startAnimating()
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), {
                let imageData = NSData(contentsOfURL: url)
                dispatch_async(dispatch_get_main_queue(), {
                    if imageData != nil {
                        self.image = UIImage(data: imageData!)
                    } else {
                        self.image = nil
                    }
                })
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
