//
//  TableListViewController.swift
//  MarvelApp
//
//  Created by Ekrem Özkaraca on 3.01.2022.
//

import UIKit
import SDWebImage


class TableListViewController : UIViewController {
    
    @IBOutlet weak var listSearchBar: UISearchBar!
    @IBOutlet weak var listTableView: UITableView!
    
    var characterList : [Results] = []
    var filteredData : [Results] = []
    var selectedChar : Results?
    var timer = Timer()
    var offSet = 0
    
    var doneBtnArra = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listTableView.separatorStyle = .none
        listTableView.register(ListTableViewCell.nib(), forCellReuseIdentifier: ListTableViewCell.identifier)
        fetchData()
        showSpinner()
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
    }
    
    @objc func timerAction(){
        fetchData()
        self.removeSpinner()
    }
    
    func fetchData() {
        DispatchQueue.main.async {
            Service.shared.getCharacterList(offSet: self.offSet) { response in
                self.characterList = response.data.results
            }
            self.filteredData = self.characterList
            self.listTableView.reloadData()
        }
    }
    
    func extractImage(data : [String : String]) -> URL {
        let path = data["path"] ?? ""
        let ext = data["extension"] ?? ""
        return URL(string: "\(path).\(ext)")!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailVC" {
            if let detailVc = segue.destination as? DetailViewController {
                detailVc.result = selectedChar
            }
        }
    }
}

extension TableListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath) as! ListTableViewCell
        cell.configure(data: filteredData[indexPath.row])
        cell.charImageView.sd_setImage(with: extractImage(data: filteredData[indexPath.row].thumbnail))
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if listSearchBar.text == "" {
            if indexPath.row == self.filteredData.count - 1 {
                self.offSet += 20
                Service.shared.getCharacterList(offSet: self.offSet) { response in
                    DispatchQueue.main.async {
                        self.characterList.append(contentsOf: response.data.results)
                        self.filteredData.removeAll()
                        self.characterList.forEach { x in
                            self.filteredData.append(x)
                        }
                        self.listTableView.reloadData()
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = listTableView.cellForRow(at: indexPath) as! ListTableViewCell
        let image = UIImage(systemName: "star.fill")
        cell.favButton.setImage(image, for: .normal)
        cell.favCheck = true
        
        Service.shared.getCharacterDetails(id: filteredData[indexPath.row].id!) { response in
            DispatchQueue.main.async {
                self.selectedChar = response.data.results.first
                self.performSegue(withIdentifier: "toDetailVC", sender: nil)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = listTableView.cellForRow(at: indexPath) as! ListTableViewCell
        let image = UIImage(systemName: "star")
        cell.favButton.setImage(image, for: .normal)
        cell.favCheck = false
    }
}

extension TableListViewController : UISearchBarDelegate {
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
        self.listTableView.reloadData()
    }
}
