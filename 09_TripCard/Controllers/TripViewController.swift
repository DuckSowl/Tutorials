//
//  TripViewController.swift
//  TripCard
//
//  Created by Anton Tolstov on 25.01.2020.
//  Copyright © 2020 Anton Tolstov. All rights reserved.
//

import UIKit

class TripViewController: UIViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    
    private var trips = [Trip(tripId: "01", city: "Paris", country: "France",
                              featuredImage: UIImage(named: "Paris"),
                              price: 2000, totalDays: 5, isLiked: false),
                         Trip(tripId: "02", city: "Rome", country: "Italy",
                              featuredImage: UIImage(named: "Rome"),
                              price: 800, totalDays: 3, isLiked: false),
                         Trip(tripId: "03", city: "Istanbul", country: "Turkey",
                              featuredImage: UIImage(named: "Istanbul"),
                              price: 2200, totalDays: 10, isLiked: false)]
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = UIColor.clear
        if UIScreen.main.bounds.size.height == 568.0 {
            let flowLayout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            flowLayout.itemSize = CGSize(width: 250.0, height: 330.0)
        }
                
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.brown.cgColor, UIColor.black.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}

// MARK: - TripCollectionCellDelegate

extension TripViewController: TripCollectionCellDelegate {
    func didLikeButtonPressed(cell: TripCollectionViewCell) {
        if let indexPath = collectionView.indexPath(for: cell) {
            trips[indexPath.row].isLiked.toggle()
            cell.isLiked.toggle()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension TripViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return trips.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TripCell", for: indexPath) as! TripCollectionViewCell
        cell.delegate = self
        
        // Configure the cell
        let trip = trips[indexPath.row]
        cell.cityLabel.text = trip.city
        cell.countryLabel.text = trip.country
        cell.imageView.image = trip.featuredImage
        cell.priceLabel.text = "$\(String(trip.price))"
        cell.totalDaysLabel.text = "\(trip.totalDays) days"
        cell.isLiked = trip.isLiked
        
        // Apply round corner
        cell.layer.cornerRadius = cell.layer.frame.width / 10
        return cell
    }
}
