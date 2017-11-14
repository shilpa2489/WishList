//
//  CustomEntityCell.swift
//  ToDoListApp
//
//  Created by Shilpa-CISPL on 14/11/17.
//  Copyright © 2017 Shilpa. All rights reserved.
//

import UIKit

class CustomEntityCell: UITableViewCell {

    @IBOutlet weak var itemNameCellLabel: UITextView!
    
    @IBOutlet weak var quantityCellLabel: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
