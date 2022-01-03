//
//  GridListViewController.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import UIKit


class GridListViewController : UIViewController {
    
    let list = ListViewController()

    private let colors : [UIColor] = [
        .systemBlue, .systemRed, .systemPink, .systemTeal, .systemGreen, .systemYellow, .systemPurple, .systemOrange, .systemIndigo, .brown, .cyan, .magenta
    ]
    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        gridCollectionView.register(GridCollectionViewCell.nib(), forCellWithReuseIdentifier: GridCollectionViewCell.identifier)
    }
}

extension GridListViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.ekrem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        
        cell.backgroundColor = colors.randomElement()
        return cell
    }
    
    
    
}

extension GridListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
    
