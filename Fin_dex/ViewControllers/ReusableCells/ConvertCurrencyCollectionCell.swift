//
//  ConvertCurrencyCollectionCell.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 26.08.2023.
//

import UIKit

class ConvertCurrencyCollectionCell: UICollectionViewCell, NibLoadableView, ReusableView {
    @IBOutlet weak var firstCurrencyLabel: UILabel!
    @IBOutlet weak var bottomView: UIView!
    
    var currency: CurrencyData? {
            didSet {
                firstCurrencyLabel.text = "\(currency?.first ?? "") -> \(currency?.second ?? "")"
            }
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
