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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func segmentedSwitched(_ sender: Any) {
        switch (segmentedController.selectedSegmentIndex) {
        case 0:
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.listContainerView.alpha = 1.0
                self.gridContainerView.alpha = 0.0
            }, completion: { (finished: Bool) in
                self.listContainerView.isHidden = false
                self.gridContainerView.isHidden = true
            })

        case 1:
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.listContainerView.alpha = 0.0
                self.gridContainerView.alpha = 1.0
            }, completion: { (finished: Bool) in
                self.listContainerView.isHidden = true
                self.gridContainerView.isHidden = false
            })
        default:
            break
        }
    }
    
}
