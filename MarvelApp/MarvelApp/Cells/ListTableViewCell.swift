//
//  ListTableViewCell.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    static let identifier = "ListTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "ListTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var favButton: UIButton!
    
    var favCheck : Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.cardView()
        charImageView.roundedImage()
    }
    
    func configure(data : Results) {
        nameLabel.text = data.name
        seriesCountLabel.text = "Series : \(data.series?.available ?? 0)"
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func favButtonClicked(_ sender: Any) {

        
    }
    
}
