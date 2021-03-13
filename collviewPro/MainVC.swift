//
//  MainVC.swift
//  collviewPro
//
//  Created by Divyesh Vekariya on 13/03/21.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var proCollectionView: UICollectionView!
    var array = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell"]
    override func viewDidLoad() {
        super.viewDidLoad()
        proCollectionView.dataSource = self
        proCollectionView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "proCell", for: indexPath) as! CollectionViewCell
        cell.proLbl.text = array[indexPath.row]
        return cell
    }
    


}
extension MainVC: UICollectionViewDataSource, UICollectionViewDelegate {

    
}
    



