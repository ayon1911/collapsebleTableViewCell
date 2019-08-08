//
//  MyCell.swift
//  collapse
//
//  Created by Khaled Rahman Ayon on 08.08.19.
//  Copyright © 2019 Khaled Rahman Ayon. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: "Avenir-Next", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Avenir-Next", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()
    lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [title, descriptionLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
//    var height: CGFloat = 0 {
//        didSet {
//            title.heightAnchor.constraint(equalToConstant: height).isActive = true
//            self.layoutIfNeeded()
//        }
//    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
//        addSubview(title)
//        NSLayoutConstraint.activate([
//                title.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//                title.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
//                title.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
//            ])
//        addSubview(descriptionLabel)
//        NSLayoutConstraint.activate([
//            descriptionLabel.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8),
//            descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
//            descriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
//            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
//            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
