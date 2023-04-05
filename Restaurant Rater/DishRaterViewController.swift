//
//  DishRaterViewController.swift
//  Restaurant Rater
//
//  Created by user238354 on 4/3/23.
//

import UIKit
import CoreData
class DishRaterViewController: UIViewController {
    
    @IBOutlet weak var dishNameTextField: UITextField!
    @IBOutlet weak var dishTypeTextField: UITextField!
    @IBOutlet weak var ratingSegmentedControl: UISegmentedControl!
    
    var restaurantObjectID: NSManagedObjectID?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveDishTapped(_ sender: Any) {
        guard let restaurantID = restaurantObjectID else {
            return
        }
        print("Attempting to save")
        let dish = Dish(context: context)
        dish.dish = dishNameTextField.text
        dish.type = dishTypeTextField.text
        dish.rating = Int16(ratingSegmentedControl.selectedSegmentIndex+1)
        do {
            let restaurant = try context.existingObject(with: restaurantID) as! Restaurant
            dish.restaurant = restaurant
            try context.save()
        }catch{
            print("Dish save fail\(error)")
        }
        navigationController?.popViewController(animated: true)
    }
}
    
    


