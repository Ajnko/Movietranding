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
    
    //ViewModel:
    var viewModel: MainViewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        self.title = "Main View"
        self.view.backgroundColor = .red
        
        setupTableView()
    }




}
