//
//  CollectionViewCell.swift
//  collviewPro
//
//  Created by Divyesh Vekariya on 13/03/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    let proLbl = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        proLbl.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(proLbl)
        
        let centerY = proLbl.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        centerY.isActive = true
        let centerX = proLbl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        centerX.isActive = true
        
        contentView.backgroundColor = .blue
        proLbl.textColor = .white
        proLbl.font = .systemFont(ofSize: 18)
        
    }
    

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
