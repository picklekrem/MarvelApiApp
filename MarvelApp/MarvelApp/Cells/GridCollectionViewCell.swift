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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
