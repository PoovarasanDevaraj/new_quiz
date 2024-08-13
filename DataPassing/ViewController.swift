//
//  ViewController.swift
//  DataPassing
//
//  Created by Poovarasan Devaraj on 07/08/24.
/*
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var dataTabel: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var personDataList: [PersonData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        dataTabel.dataSource = self
        dataTabel.delegate = self
    }

    @IBAction func dataAddingTapButton(_ sender: Any) {
        persentDataDetailsViewController (for: nil)
    }
    
    func persentDataDetailsViewController(for persondata: PersonData?, at index: Int? = nil) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dataDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DataDetailsViewController") as? DataDetailsViewController {
            dataDetailsViewController.completionHandler = { [weak self] updatedPersonData in
                if let index = index {
                    self?.personDataList[index] = updatedPersonData
                } else {
                    self?.personDataList.append(updatedPersonData)
                }
                self?.dataTabel.reloadData()
            }
            navigationController?.pushViewController(dataDetailsViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as? DataTableViewCell else {
            return UITableViewCell()
        }
        let personData = personDataList[indexPath.row]
        cell.nameText.text = personData.name
        cell.ageText.text = "\(personData.age ?? 0)"
        cell.editAction = {[weak self] in
            self?.persentDataDetailsViewController(for: personData, at: indexPath.row)
        }
        return cell
    }
}
*/
import UIKit
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, DataTableViewCellDelegate {

    @IBOutlet weak var dataTabel: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var personDataList: [PersonData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "BIO DATA"
        
        dataTabel.dataSource = self
        dataTabel.delegate = self
        
    }

    @IBAction func dataAddingTapButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dataDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DataDetailsViewController") as? DataDetailsViewController {
            dataDetailsViewController.completionHandler = { [weak self] personData, index in
                if let index = index {
                    self?.personDataList[index] = personData
                } else {
                    self?.personDataList.append(personData)
                }
                self?.dataTabel.reloadData()
            }
            navigationController?.pushViewController(dataDetailsViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as? DataTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        let personData = personDataList[indexPath.row]
        cell.nameText.text = personData.name
        cell.ageText.text = "\(personData.age ?? 0)"
        return cell
    }

    func didTapTextField(cell: DataTableViewCell) {
        guard let indexPath = dataTabel.indexPath(for: cell) else { return }
        let personData = personDataList[indexPath.row]
        navigateToDataDetailsViewController(with: personData, at: indexPath.row)
    }

    func navigateToDataDetailsViewController(with personData: PersonData, at index: Int) {  
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let dataDetailsViewController = storyboard.instantiateViewController(withIdentifier: "DataDetailsViewController") as? DataDetailsViewController {
            dataDetailsViewController.personData = personData
            dataDetailsViewController.index = index
            dataDetailsViewController.completionHandler = { [weak self] personData, index in
                if let index = index {
                    self?.personDataList[index] = personData
                } else {
                    self?.personDataList.append(personData)
                }
                self?.dataTabel.reloadData()
            }
            navigationController?.pushViewController(dataDetailsViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let personData = personDataList[indexPath.row]
        navigateToDataDetailsViewController(with: personData, at: indexPath.row)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                personDataList.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
}

