//
//  PokemonCell.swift
//  pokapp
//
//  Created by Dhiman, Sabi (Consumer Servicing & Engagement Platform) on 21/02/2023.
//

import UIKit
//create custom cell
class PokemonCell: UITableViewCell {
    
    //initialise uiimageview
    
    let imageIV  = CustomImageView()
    let nameLabel = UILabel()
    let typeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Setup
    func setupView(){
      
        configureImageView()
        configureNameLabel()
        configureTypeLabel()
    }
    
    func configureImageView() {
      addSubview(imageIV)
        //contraints
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
       
    }
    func configureNameLabel() {
        addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4).isActive = true
        nameLabel.font = UIFont(name: "Verdana-Bold", size: 16)
    }
    func configureTypeLabel(){
        addSubview(typeLabel)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.leadingAnchor.constraint(equalTo: imageIV.trailingAnchor, constant: 5).isActive = true
        typeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        typeLabel.font = UIFont(name: "Verdana", size: 14)
    }
    
    
}
