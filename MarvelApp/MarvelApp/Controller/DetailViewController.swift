//
//  DetailViewController.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 6.01.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var result : Results?
    
    @IBOutlet weak var headerContainerView: UIView!
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var charSeriesLabel: UILabel!
    @IBOutlet weak var charComicsLabel: UILabel!
    @IBOutlet weak var charStoriesLabel: UILabel!
    @IBOutlet weak var charEventLabel: UILabel!
    @IBOutlet weak var favView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(data: result!)
        let favClickedEvent : UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(favouriteClicked))
        self.favView.isUserInteractionEnabled = true
        self.favView.addGestureRecognizer(favClickedEvent)
        
    }
    
    func setupUI () {
        charImageView.contentMode = .scaleToFill
    }
    
    func getData(data : Results) {
        characterNameLabel.text = "\(data.name ?? "")      #\(data.id ?? 0)"
        charImageView.sd_setImage(with: extractImage(data: data.thumbnail))
        charSeriesLabel.text = data.series?.items.first?.name
        charComicsLabel.text = data.comics?.items.first?.name
        charStoriesLabel.text = data.series?.items.first?.name
        charEventLabel.text = data.events?.items.first?.name
        
    }
    
    func extractImage(data : [String : String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
    
    @objc func favouriteClicked() {
        print("heyyy")
    }
    
    @IBAction func closeButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
}
