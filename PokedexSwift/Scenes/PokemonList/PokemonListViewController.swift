//
//  PokemonListViewController.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/1/21.
//

import UIKit

class PokemonListViewController: UIViewController, Storyboarded {
    
    static var storyboardName: String = "PokemonList"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    weak var coordinator: PokemonListCoordinatorProtocol?
    var viewModel: PokemonListViewModelProtocol!
    
    private var previewLayout: VerticalFlowLayout!
    private var displayedCellsIndexPaths = Set<IndexPath>()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupBindables()
        
        viewModel?.getPokemonList()
    }
    
    // MARK: - Private
    
    private func setupUI() {
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.registerNib(cellType: PokemonListPreviewCollectionViewCell.self)
        
        let preferredHeight: CGFloat = 150.0
        let previewLayoutWidth = preferredHeight / CGFloat(1.5)
        previewLayout = VerticalFlowLayout(preferredWidth: previewLayoutWidth,
                                           preferredHeight: preferredHeight,
                                           minColumns: 3)
        
        collectionView.collectionViewLayout = previewLayout
    }
    
    private func reloadCollectionView() {
        guard let _ = viewModel else { return }
        
        collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    // MARK: - Bindables
    
    private func setupBindables() {
        viewModel?.pokemonsList.bind({ [weak self] pokemons in
            guard let strongSelf = self else { return }
            DispatchQueue.main.async {
                strongSelf.reloadCollectionView()
            }
        })
    }
    
}

// MARK: - UICollectionViewDelegate

extension PokemonListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !displayedCellsIndexPaths.contains(indexPath) {
            displayedCellsIndexPaths.insert(indexPath)
            CollectionViewFadeAnimation.fadeAnimate(cell: cell)
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension PokemonListViewController: UICollectionViewDataSource {
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemonsCells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModelFocus = viewModel.pokemonsCells[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonListPreviewCollectionViewCell", for: indexPath) as! PokemonListPreviewCollectionViewCell
        cell.viewModel = viewModelFocus
        
        return cell
    }
    
}
