//
//  ListViewController.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var listContainerView: UIView!
    @IBOutlet weak var gridContainerView: UIView!
    
    var ekrem = [1,2,2,3,3,3,2,2,231,23,12,312,3,12,31,23,12,31,2]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // network call yapıyorum
        //bunu bir tane değişkene atıyorum
    }
    
   
    @IBAction func segmentedSwitched(_ sender: Any) {
        switch (segmentedController.selectedSegmentIndex) {
        case 0:
            listContainerView.isHidden = false
            gridContainerView.isHidden = true
        case 1:
            listContainerView.isHidden = true
            gridContainerView.isHidden = false
        default:
            break
        }
        print("switched")
    }
    
}




