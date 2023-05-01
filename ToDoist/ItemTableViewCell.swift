//
//  ItemTableViewCell.swift
//  ToDoist
//
//  Created by Parker Rushton on 10/21/22.
//

import UIKit

protocol ItemCellDelegate {
    func completeButtonPressed(item: Item)
}


class ItemTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String { "ItemTableViewCell" }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var completedButton: UIButton!
    
    var item: Item?
    var delegate: ItemCellDelegate?
    
    private let checkedImage = UIImage(systemName: "checkmark.square.fill")
    private let squareImage = UIImage(systemName: "square")

    
    func update(with item: Item) {
        self.item = item
        titleLabel.text = item.title
        subtitleLabel.text = item.subtitle
        setButtonImage(isCompleted: item.isCompleted)
    }

    @IBAction func completeButtonPressed(_ sender: Any) {
        guard let item else { return }
        setButtonImage(isCompleted: !item.isCompleted)
        delegate?.completeButtonPressed(item: item)
    }
    
    func setButtonImage(isCompleted: Bool) {
        let image = isCompleted ? checkedImage : squareImage
        completedButton.setImage(image, for: .normal)
    }
    
}
