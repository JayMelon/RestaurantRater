//
//  ViewController.swift
//  Restaurant Rater
//
//  Created by user238354 on 4/3/23.
//

import UIKit
import CoreData
class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    var restaurantObjectID: NSManagedObjectID?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBAction func saveRestaurantTapped(_ sender: UIButton) {
        //Creating Object
        let restaurant = Restaurant(context: context)
        restaurant.name = nameTextField.text
        restaurant.address = addressTextField.text
        
        do {
            try context.save()
            restaurantObjectID = restaurant.objectID
        } catch {
            print("Didn't save due to \(error)")
        }
    }
    @IBAction func rateDishTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "RateDish", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RateDish" {
            let destinationVC = segue.destination as! DishRaterViewController
            destinationVC.restaurantObjectID = restaurantObjectID
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

