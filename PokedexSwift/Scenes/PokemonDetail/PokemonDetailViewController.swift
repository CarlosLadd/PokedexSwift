//
//  PokemonDetailViewController.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/7/21.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    // Container
    
    
    // UI
    let pokemonImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pokemonName: UILabel = {
        let name = UILabel()
        name.textAlignment = .center
        return name
    }()
    
    var pokemonSelected: DLPokemon!
    
    // View Model
    var viewModel: PokemonListViewModelProtocol!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        refreshUI(with: traitCollection.userInterfaceStyle)
    }
    
    // MARK: - Dark Mode
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        // Code
    }

    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        refreshUI(with: newCollection.userInterfaceStyle)
    }
    
    // MARK: - UI
    
    private func setupUI() {
        pokemonImage.frame = CGRect(x: 16,
                                    y: K.hasTopNotch() + 44.0 + 16,
                                    width: self.view.frame.size.width - 32.0,
                                    height: 200.0)
        
        pokemonName.frame = CGRect(x: pokemonImage.frame.origin.x,
                                   y: pokemonImage.bounds.height + pokemonImage.frame.origin.y + 10.0,
                                   width: pokemonImage.bounds.width,
                                   height: 24.0)
        
        if let urlString = pokemonSelected.imageURL {
            let imageURL = URL(string: urlString)
            pokemonImage.setImage(with: imageURL)
        } else {
            pokemonImage.backgroundColor = .lightGray
        }
        
        pokemonName.text = pokemonSelected.name?.uppercased()
        
        self.view.addSubview(pokemonImage)
        self.view.addSubview(pokemonName)
    }
    
    private func refreshUI(with userInterface: UIUserInterfaceStyle) {
        switch userInterface {
        case .dark:
            self.view.backgroundColor = .black
            pokemonName.textColor = .white
            break
        case .light, .unspecified:
            self.view.backgroundColor = .white
            pokemonName.textColor = .darkGray
            break
        default:
            self.view.backgroundColor = .white
            pokemonName.textColor = .darkGray
            break
        }
    }
    
}
