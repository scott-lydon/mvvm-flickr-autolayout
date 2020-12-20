//
//  SearchCoordinator.swift
//  mvvm-flickr-autolayout
//
//  Created by Daniel on 19.12.2020.
//

import UIKit

protocol SearchFlow: class {
    func coordinateToDetail(viewModel: SearchResultViewModel)
}


class SearchCoordinator: Coordinator, SearchFlow {
    
    
    
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchViewController = SearchViewController()
        searchViewController.coordinator = self
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    func coordinateToDetail(viewModel: SearchResultViewModel) {
        let detailsViewController = DetailsViewController()
//        detailsViewController.coordinator = self
        detailsViewController.viewModel = viewModel
        navigationController?.pushViewController(detailsViewController, animated: true)
        
        
//        let detailsCoordinator = DetailsCoordinator(navigationController: navigationController!)
//        coordinate(to: detailsCoordinator)
    }
}
