//
//  photoCell.swift
//  instaclone
//
//  Created by Mario Delgado on 1/31/17.
//  Copyright © 2017 Mario Delgado. All rights reserved.
//

import UIKit

class photoCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
