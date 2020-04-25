//
//  MoreDetailsView.swift
//  kannada
//
//  Created by PraveenH on 18/04/20.
//  Copyright © 2020 books. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MoreDetailsView: UIViewController {
     
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var ibtitlelbl: UILabel!
    @IBOutlet weak var ibTextView: UITextView!
    var detail : Other?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ibTextView.text = self.detail?.note
        self.ibtitlelbl.text = self.detail?.short
        self.loadBannerAd(self.bannerView)
    }
 
    @IBAction func didTapOnCancelBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillTransition(
       to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator
     ) {
       coordinator.animate(alongsideTransition: { _ in
         self.loadBannerAd(self.bannerView)
       })
     }
    
}
