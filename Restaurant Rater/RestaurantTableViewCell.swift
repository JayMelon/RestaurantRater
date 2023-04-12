//
//  RestaurantTableViewCell.swift
//  Restaurant Rater
//
//  Created by user238354 on 4/5/23.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    
    func configure(with restaurant: Restaurant){
        nameLabel.text = restaurant.name
        nameLabel.text = restaurant.address
        
        
        let dishes = restaurant.dishes?.allObjects as? [Dish] ?? []
        let dishInfo = dishes.map {"\($0.dish ?? "") (\($0.type ?? "")): \($0.rating    )"}
        ratingLabel.text = dishInfo.joined(separator: "\n")
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
