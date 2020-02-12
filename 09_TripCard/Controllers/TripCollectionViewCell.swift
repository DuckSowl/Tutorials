//
//  TripCollectionViewCell.swift
//  TripCard
//
//  Created by Anton Tolstov on 25.01.2020.
//  Copyright © 2020 Anton Tolstov. All rights reserved.
//

import UIKit

class TripCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var totalDaysLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var likeButton: UIButton!
    
    var delegate:TripCollectionCellDelegate?
    
    var isLiked = false {
        didSet {
            likeButton.setImage(UIImage(systemName: "heart\(isLiked ? ".fill" : "")"),
                                for: .normal)
        }
    }
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        delegate?.didLikeButtonPressed(cell: self)
    }
}

protocol TripCollectionCellDelegate {
    func didLikeButtonPressed(cell: TripCollectionViewCell)
}
