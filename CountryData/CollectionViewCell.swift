//
//  CollectionViewCell.swift
//  CountryData
//
//  Created by HoangHai on 9/21/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView_Flag: UIImageView!
    
    @IBOutlet weak var lbl_countryName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(country: Country) {
        imageView_Flag.image = UIImage(named: "\(country.alpha2Code!).png")
        lbl_countryName.text = country.name
    }
}
