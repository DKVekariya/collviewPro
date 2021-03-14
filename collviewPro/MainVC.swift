//
//  MainVC.swift
//  collviewPro
//
//  Created by Divyesh Vekariya on 13/03/21.
//

import UIKit

class MainVC: UIViewController {
    
    lazy var proCollectionView: UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout() )
        view.dataSource = self
        view.delegate = self
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "proCell")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = nil
        return view
    }()
    
    var array = ["First Cell", "Second Cell", "Third Cell", "Fourth Cell", "Fifth Cell", "Sixth Cell", "Fifth Cell", "Sixth Cell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(proCollectionView)
        
        let array = [
            proCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            proCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            proCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            proCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        
        array.forEach({ $0.isActive = true })
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { (_) in
            self.proCollectionView.collectionViewLayout.invalidateLayout()
        }
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "proCell", for: indexPath) as! CollectionViewCell
        cell.proLbl.text = array[indexPath.row]
        return cell
    }
}
    
extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let effectiveWith = collectionView.frame.width - self.collectionView(collectionView, layout: collectionViewLayout, minimumLineSpacingForSectionAt: indexPath.section) - 2*16
        return CGSize.init(width: effectiveWith*0.5, height: effectiveWith*0.5)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        .init(top: 16, left: 16, bottom: 16, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        16
    }
}


