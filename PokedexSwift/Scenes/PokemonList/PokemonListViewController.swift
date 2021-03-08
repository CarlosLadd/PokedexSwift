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
    private var prefetchDataSource: CollectionViewDataSourcePrefetching!
    private var dataSource: CollectionViewDataSourcePaging<PokemonListCellViewModelProtocol>!
    
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
        
        dataSource = CollectionViewDataSourcePaging.make(for: viewModel.pokemonsCells)
        
        prefetchDataSource = CollectionViewDataSourcePrefetching(cellCount: viewModel.pokemonsCells.count,
                                                                     needsPrefetch: viewModel.needsPrefetch,
                                                                     prefetchHandler: { [weak self] in
                                                                        self?.viewModel?.getPokemonList()
                                                                     })
        
        collectionView.dataSource = dataSource
        collectionView.prefetchDataSource = prefetchDataSource
        collectionView.reloadData()
    }
    
    // MARK: - Bindables
    
    private func setupBindables() {
        viewModel?.pokemonListViewState.bind({ [weak self] state in
            guard let strongSelf = self else { return }
            
            DispatchQueue.main.async {
                strongSelf.configureView(withState: state)
                strongSelf.reloadCollectionView()
            }
        })
    }
    
    // MARK: - View State
    
    private func configureView(withState state: PagingViewState<DLPokemon>) {
        switch state {
        case .populated, .paging, .initial:
            collectionView.backgroundView = UIView(frame: .zero)
        case .empty:
            print("Show empty state")
        case .error(_):
            print("Show retry state")
        }
    }
    
}

// MARK: - UICollectionViewDelegate

extension PokemonListViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        coordinator?.showPokemonDetail(for: viewModel.getPokemonAt(index: indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if !displayedCellsIndexPaths.contains(indexPath) {
            displayedCellsIndexPaths.insert(indexPath)
            CollectionViewFadeAnimation.fadeAnimate(cell: cell)
        }
    }
    
}

// MARK: - TabBarScrollable

extension PokemonListViewController: TabBarScrollable {
    
    func handleTabBarSelection() {
        collectionView.scrollToTop(animated: true)
    }
    
}
