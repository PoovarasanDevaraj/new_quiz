//
//  DataTableViewCell.swift
//  DataPassing
//
//  Created by Poovarasan Devaraj on 07/08/24.
/*
 import UIKit
 
 protocol DataTableViewCellDelegate: AnyObject {
 func didTapTextField(cell: DataTableViewCell)
 }
 
 class DataTableViewCell: UITableViewCell {
 
 @IBOutlet weak var nameLabel: UILabel!
 @IBOutlet weak var nameText: UILabel!
 @IBOutlet weak var ageLabel: UILabel!
 @IBOutlet weak var ageText: UILabel!
 
 weak var delegate: DataTableViewCellDelegate?
 
 var editAction: (() -> Void)?
 
 override func awakeFromNib() {
 super.awakeFromNib()
 
 let nameTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
 nameText.addGestureRecognizer(nameTapGesture)
 nameText.isUserInteractionEnabled = true
 
 let ageTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
 ageText.addGestureRecognizer(ageTapGesture)
 ageText.isUserInteractionEnabled = true
 }
 
 @objc func handleTap() {
 editAction?()
 }
 
 override func setSelected(_ selected: Bool, animated: Bool) {
 super.setSelected(selected, animated: animated)
 nameText.layer.borderColor = UIColor.black.cgColor
 nameText.layer.borderWidth = 0.2
 nameText.layer.cornerRadius = 5
 nameText.layer.masksToBounds = true
 
 ageText.layer.borderColor = UIColor.black.cgColor
 ageText.layer.borderWidth = 0.2
 ageText.layer.cornerRadius = 5
 ageText.layer.masksToBounds = true
 }
 }
 
 */
import UIKit

protocol DataTableViewCellDelegate: AnyObject {
    func didTapTextField(cell: DataTableViewCell)
}

class DataTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var ageText: UILabel!
    
    weak var delegate: DataTableViewCellDelegate?  
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let nameTapGesture = UITapGestureRecognizer(target: self, action: #selector(nameTextTapped))  // Add tap gesture
        nameText.addGestureRecognizer(nameTapGesture)
        nameText.isUserInteractionEnabled = true
        
        let ageTapGesture = UITapGestureRecognizer(target: self, action: #selector(ageTextTapped))  // Add tap gesture
        ageText.addGestureRecognizer(ageTapGesture)
        ageText.isUserInteractionEnabled = true
    }

    @objc func nameTextTapped() {
        delegate?.didTapTextField(cell: self)
    }

    @objc func ageTextTapped() {
        delegate?.didTapTextField(cell: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        nameText.layer.borderColor = UIColor.black.cgColor
        nameText.layer.borderWidth = 0.2
        nameText.layer.cornerRadius = 5
        nameText.layer.masksToBounds = true
        
        ageText.layer.borderColor = UIColor.black.cgColor
        ageText.layer.borderWidth = 0.2
        ageText.layer.cornerRadius = 5
        ageText.layer.masksToBounds = true
    }
}
