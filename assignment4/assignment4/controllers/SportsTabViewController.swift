//
//  SportsTabViewController.swift
//  assignment4
//
//  Created by Alberto Leon on 10/24/18.
//  Copyright © 2018 Alberto Leon. All rights reserved.
//

import UIKit

class SportsTabViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UIAlertViewDelegate {
    
    var country = ""
    var sport = ""
    var selectedItemsArray: [String] = []
    
    let india = "india"
    let usa = "usa"
    let taiwan = "taiwan"
    
    let countries = ["India", "USA", "Taiwan"]
    let indiaSports = ["Cricket", "Chess", "Badminton", "Field", "Hockey", "Football", "Tennis", "Gilli-danda", "Golf"]
    let unitedStatesSports = ["Baseball", "Football", "Curling", "Basketball", "Soccer", "Rock Climbing", "Skateboarding"]
    let taiwanSports = ["Football", "Archery", "Baseball", "Table Tennis", "Cycling", "Taekwondo"]
    
    @IBOutlet weak var countryPicker: UIPickerView!
    @IBOutlet weak var sportsPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryPicker.delegate = self
        self.countryPicker.dataSource = self
        
        self.sportsPicker.delegate = self
        self.sportsPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == countryPicker {
            return countries.count
        } else if pickerView == sportsPicker {
            return selectedItemsArray.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == countryPicker {
            return countries[row]
        } else if pickerView == sportsPicker {
            return selectedItemsArray[row]
        }
        return ""
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == countryPicker {
            switch row {
            case 0:
                selectedItemsArray = indiaSports
                self.country = countries[row]
            case 1:
                selectedItemsArray = unitedStatesSports
                self.country = countries[row]
            case 2:
                selectedItemsArray = taiwanSports
                self.country = countries[row]
            default:
                selectedItemsArray = indiaSports
            }
            sportsPicker.reloadAllComponents();
        }
            // IMPORTANT reload the data on the item picker
        if pickerView == sportsPicker {
            switch country.lowercased() {
            case self.india:
                self.sport = indiaSports[row]
                showAlert()
            case self.usa:
                self.sport = unitedStatesSports[row]
                showAlert()
            case self.taiwan:
                self.sport = taiwanSports[row]
                showAlert()
            default:
                break;
            }
        }
    }
    
    @IBAction func showAlert() {
        let alert = UIAlertController(title: "Country: \(self.country)", message: "Sport: \(self.sport)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        
        self.present(alert, animated: true)
    }
}
