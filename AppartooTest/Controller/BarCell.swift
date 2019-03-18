//
//  BarCell.swift
//  AppartooTest
//
//  Created by Vigneswaranathan Sugeethkumar on 14/03/2019.
//  Copyright © 2019 Vigneswaranathan Sugeethkumar. All rights reserved.
//

import UIKit

class BarCell: UITableViewCell {

    @IBOutlet weak var barImageView: UIImageView!
    @IBOutlet weak var barName: UILabel!
    @IBOutlet weak var barAdress: UILabel!
    
    func setImageBar (image: UIImage,name: String,tags: String){
        barImageView.image = image
        barName.text = name
        barAdress.text = tags
    }
}
