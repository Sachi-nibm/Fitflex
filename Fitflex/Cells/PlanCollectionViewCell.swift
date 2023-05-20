//
//  PlanCollectionViewCell.swift
//  Fitflex
//
//  Created by Sachini Perera on 2023-05-20.
//

import UIKit

class PlanCollectionViewCell: UICollectionViewCell {
    let label = UILabel()
    static let reuseIdentifier = "PlanCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        contentView.addSubview(label)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
//        label.layer.borderWidth = 1
//        label.layer.borderColor = UIColor.systemBlue.cgColor
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)
        ])
    }
}
