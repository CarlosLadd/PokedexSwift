//
//  PokemonListPreviewCollectionViewCell.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

final class PokemonListPreviewCollectionViewCell: UICollectionViewCell, PokemonListCollectionViewCellProtocol {
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var viewModel: PokemonListCellViewModelProtocol? {
        didSet {
            setupBindables()
        }
    }
    
    // MARK: - Lifecycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        pokemonImage.image = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        isAccessibilityElement = true
    }
    
    // MARK: - Bindable
    
    private func setupBindables() {
        guard let viewModel = viewModel else { return }
        
        if let imageURL = viewModel.imageURL {
            pokemonImage.setImage(with: imageURL)
        } else {
            pokemonImage.backgroundColor = .darkGray
        }
    }
    
}
