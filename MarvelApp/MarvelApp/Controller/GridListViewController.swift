//
//  GridListViewController.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import UIKit


class GridListViewController : UIViewController {
    
    @IBOutlet weak var gridCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var characterList : [Results] = []
    var filteredData : [Results] = []
    var timer = Timer()
    var offSet = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gridCollectionView.register(GridCollectionViewCell.nib(), forCellWithReuseIdentifier: GridCollectionViewCell.identifier)
        fetchData()
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
    
    }
    
    @objc func timerAction(){
        fetchData()
    }
    
    func fetchData() {
        DispatchQueue.main.async {
            Service.shared.getCharacterList(offSet: self.offSet) { response in
                self.characterList = response.data.results
            }
            self.filteredData = self.characterList
            self.gridCollectionView.reloadData()
        }
    }
    
    func extractImage(data : [String : String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
}

extension GridListViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GridCollectionViewCell", for: indexPath) as! GridCollectionViewCell
        cell.configure(data: filteredData[indexPath.row])
        cell.charImageView.sd_setImage(with: extractImage(data: filteredData[indexPath.row].thumbnail))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if searchBar.text == "" {
            if indexPath.row == self.filteredData.count - 1 {
                self.offSet += 20
                Service.shared.getCharacterList(offSet: self.offSet) { response in
                    DispatchQueue.main.async {
                        self.characterList.append(contentsOf: response.data.results)
                        self.filteredData.removeAll()
                        self.characterList.forEach { x in
                            self.filteredData.append(x)
                        }
                        self.gridCollectionView.reloadData()
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let noOfCellsInRow = 2
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left + flowLayout.sectionInset.right + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
        let size = Int((gridCollectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
        return CGSize(width: size, height: size)
    }
    
}

extension GridListViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData  = []
        
        if searchText == "" {
            filteredData = characterList
        }
        
        characterList.forEach { z in
            if z.name?.uppercased().contains(searchText.uppercased()) == true {
                filteredData.append(z)
            }
        }
        self.gridCollectionView.reloadData()
    }
}
    
