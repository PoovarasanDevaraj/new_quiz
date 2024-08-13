//
//  DataDetailsViewController.swift
//  DataPassing
//
//  Created by Poovarasan Devaraj on 07/08/24.
/*
import UIKit

class DataDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var personData: PersonData?
    var completionHandler: ((PersonData) -> Void)?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let personData = personData {
            nameText.text = personData.name
            ageText.text = "\(personData.age ?? 0)"
        }
    }

    @IBAction func doneTappedButton(_ sender: Any) {
        
        guard let name = nameText.text, !name.isEmpty,
              let ageText = ageText.text, let age = Int(ageText) else {
            return
        }
        
        let personData = PersonData(name: name, age: age)
        completionHandler?(personData)
        navigationController?.popViewController(animated: true)
    }
}
*/
import UIKit

class DataDetailsViewController: UIViewController {
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    var personData: PersonData?
    var completionHandler: ((PersonData, Int?) -> Void)?
    var index: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        if let personData = personData {
            nameText.text = personData.name
            ageText.text = "\(personData.age ?? 0)"
        }
    }

    @IBAction func doneTappedButton(_ sender: Any) {
        guard let name = nameText.text, !name.isEmpty,
              let ageText = ageText.text, let age = Int(ageText) else {
            return
        }
        
        let personData = PersonData(name: name, age: age)
        completionHandler?(personData, index)
        navigationController?.popViewController(animated: true)
    }
}

