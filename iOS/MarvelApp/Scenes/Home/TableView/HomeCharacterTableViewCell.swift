//
//  HomeCharacterTableViewCell.swift
//  MarvelApp
//
//  Created by Suyash Srijan on 17/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation
import UIKit

class HomeCharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterImageWrapper: UIView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterNameBg: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.characterImageWrapper.clipsToBounds = true
        self.characterNameBg.layer.masksToBounds = false
        self.characterNameBg.layer.cornerRadius = 3
        self.characterName.font = UIFont(name: "BentonSans Comp Black", size: 21)
    }
    
}
