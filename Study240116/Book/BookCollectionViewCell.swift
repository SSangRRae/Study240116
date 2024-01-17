//
//  BookCollectionViewCell.swift
//  Study240116
//
//  Created by SangRae Kim on 1/17/24.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        commonDesign()
    }
    
    func commonDesign() {
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textAlignment = .center
        
        priceLabel.font = .systemFont(ofSize: 15)
        priceLabel.textAlignment = .center
    }
    
    func configureCell(_ item: Document) {
        let url = URL(string: item.thumbnail)
        bookImageView.kf.setImage(with: url)
        titleLabel.text = item.title
        priceLabel.text = "\(item.price)원"
    }
}
