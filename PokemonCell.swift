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
    
    let imageIV  = UIImageView()
    var safeArea: UILayoutGuide!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Setup
    func setupView(){
        safeArea = layoutMarginsGuide
        configureImageView()
    }
    
    func configureImageView() {
      addSubview(imageIV)
        //contraints
        imageIV.translatesAutoresizingMaskIntoConstraints = false
        imageIV.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        imageIV.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        imageIV.widthAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.heightAnchor.constraint(equalToConstant: 40).isActive = true
        imageIV.backgroundColor = .red
    }
    
    
}
