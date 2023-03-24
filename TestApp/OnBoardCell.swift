//
//  OnBoardCell.swift
//  TestApp
//
//  Created by Phincon on 24/03/23.
//

import UIKit

class OnBoardCell: UICollectionViewCell {
    
    lazy var imageOnBoard: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "jazzy")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var titleLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Let's meet our summer coffee drinks"
        label.textAlignment = .center
        return label
    }()
    
    lazy var descLbl: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 13, weight: .heavy)
        label.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: -setup content constraint
    func setupConstraint(){
        //MARK: - setup constraint collectionview
        NSLayoutConstraint.activate([
            imageOnBoard.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
            imageOnBoard.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageOnBoard.widthAnchor.constraint(equalToConstant: contentView.frame.width / 4),
            imageOnBoard.heightAnchor.constraint(equalToConstant: contentView.frame.height / 3)
        ])
        
        //MARK: -setup constraint title
        NSLayoutConstraint.activate([
           titleLbl.topAnchor.constraint(equalTo: imageOnBoard.bottomAnchor, constant: 30),
           titleLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
           titleLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        //MARK: -setup constraint desctitle
        NSLayoutConstraint.activate([
           descLbl.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20),
           descLbl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
           descLbl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    
    //MARK: - add view to contentview
    func setupView(){
        [imageOnBoard, titleLbl, descLbl].forEach { views in
            contentView.addSubview(views)
        }
    }
    
}
