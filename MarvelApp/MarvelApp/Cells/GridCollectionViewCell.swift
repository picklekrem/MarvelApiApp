//
//  GridCollectionViewCell.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {

    static let identifier = "GridCollectionViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "GridCollectionViewCell", bundle: nil)
    }
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var charImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.cardView()
    }
    
    func configure(data : Results) {
        nameLabel.text = data.name
        seriesCountLabel.text = "Series : \(data.series?.available ?? 0)"
        
    }

}
