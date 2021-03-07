//
//  CollectionViewDataSourcePaging.swift
//  PokedexSwift
//
//  Created by Carlos Landaverde on 3/7/21.
//

import UIKit

final class CollectionViewDataSourcePaging<ViewModel>: NSObject, UICollectionViewDataSource {
    
    typealias CellConfigurator = (ViewModel, UICollectionViewCell) -> Void
    
    private let reuseIdentifier: String
    private let cellConfigurator: CellConfigurator
    
    private var cellViewModels: [ViewModel]
    
    // MARK: - Initializers
    
    init(cellViewModels: [ViewModel], reuseIdentifier: String, cellConfigurator: @escaping CellConfigurator) {
        self.cellViewModels = cellViewModels
        self.reuseIdentifier = reuseIdentifier
        self.cellConfigurator = cellConfigurator
    }
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let viewModel = cellViewModels[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cellConfigurator(viewModel, cell)
        return cell
    }

}

extension CollectionViewDataSourcePaging where ViewModel == PokemonListCellViewModelProtocol {
    
    static func make(for cellViewModels: [ViewModel]) -> CollectionViewDataSourcePaging {
        return CollectionViewDataSourcePaging(cellViewModels: cellViewModels,
                                              reuseIdentifier: PokemonListPreviewCollectionViewCell.dequeuIdentifier,
                                              cellConfigurator: { (viewModel, cell) in
                                                var cell = cell as! PokemonListCollectionViewCellProtocol
                                                cell.viewModel = viewModel
        })
    }
    
}
