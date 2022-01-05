//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 6.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var result = "ekrem"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        nameLabel.text = result
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
