//
//  PokemonListVC.swift
//  PokemonApp
//
//  Created by Dhiman, Sabi (Consumer Servicing & Engagement Platform) on 18/02/2023.
//

import UIKit


class PokemonListVC: UIViewController {
   
   
    let tableView = UITableView()
    var pokemonList = [Pokemon]() // this means assigning empty array
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureUI()
        let anonymousFunction = { (fetchPokemonList: [Pokemon]) in
            DispatchQueue.main.async {
                self.pokemonList = fetchPokemonList
                self.tableView.reloadData()
            }
        }
        PokemonAPI.shared.fetchPokemonList(onCompletion: anonymousFunction)
    }
    
    func configureUI(){
        configureTableView()
    }
    func configureTableView() {
        view.addSubview(tableView)
        
        //set delegates
        //set row height
        //register cells
        //set constraints
        setTableViewDelegates()
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonCell.self, forCellReuseIdentifier: "cellId")
        
    }
}

extension PokemonListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count //link to array
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) // give cell an id
        
        let pokemon = pokemonList[indexPath.row] //point to data
        //casting normal uitableviewcell as a custom cell
        
        guard let pokemonCell = cell as? PokemonCell else {
            return cell
        }
        
        pokemonCell.nameLabel.text = pokemon.name // add text to cell
        pokemonCell.typeLabel.text = pokemon.type
        //pokemonCell.imageIV.image = pokemon.imageUrl
        if let url  = URL(string: pokemon.imageUrl!) {
            
            pokemonCell.imageIV.loadImage(from: url)
        }
                return cell
    }
    
    
    
}


