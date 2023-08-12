//
//  MainViewController.swift
//  Movietranding
//
//  Created by Abdulbosid Jalilov on 09/08/23.
//

import UIKit

class MainViewController: UIViewController {
    
    //IBOutlets:
    @IBOutlet var tableView: UITableView!
    @IBOutlet var activeIndicator: UIActivityIndicatorView!
    
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    //variable
    var cellDataSource: [MovieTableCellViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.getData()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .systemBackground
        
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isLoading in
            guard let self = self, let isLoading = isLoading else {
                return
            }
            
            DispatchQueue.main.async {
                if isLoading {
                    self.activeIndicator.startAnimating()
                } else {
                    self.activeIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] movies in
            guard let self = self, let movies = movies else {
                return
            }
            
            self.cellDataSource = movies
            self.reloadTableView()
        }
    }
    
    func openDetail(movieID: Int)  {
        guard let movie = viewModel.retriveMovie(with: movieID) else {
            return
        }
        
        let detailsViewModel = DetailsMovieViewModel(movie: movie)
        let detailsController = DetailsMovieViewController(viewModel: detailsViewModel)
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(detailsController, animated: true)
        }
    }


}
