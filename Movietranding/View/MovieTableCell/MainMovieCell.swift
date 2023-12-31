//
//  MainMovieCell.swift
//  Movietranding
//
//  Created by Abdulbosid Jalilov on 11/08/23.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
        
    public static var identifier: String {
        get {
            return "MainMovieCell"
        }
    }
    
    public static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    //IBOutlets:
    @IBOutlet var backView: UIView!
    
    @IBOutlet var movieImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    @IBOutlet var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.addBorder(color: .label, width: 1)
        backView.backgroundColor = .lightGray
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
        self.movieImageView.sd_setImage(with: viewModel.imageURL)
    }


    
}
