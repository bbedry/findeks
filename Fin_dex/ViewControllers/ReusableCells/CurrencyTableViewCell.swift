//
//  CurrencyTableViewCell.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 13.08.2023.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var coinContainerView: UIView!
    @IBOutlet weak var coinLogoImage: UIImageView!
    @IBOutlet weak var coinFullName: UILabel!
    @IBOutlet weak var coinTitle: UILabel!
    @IBOutlet weak var chartView: UIView!
    @IBOutlet weak var userWalletValue: UILabel!
    @IBOutlet weak var coinTotalValue: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupView()
    }
    
    
    func setupView() {
        coinContainerView.setCircleView()
        topView.topCornerRadius(radius: 4)
        topView.bottomCornerRadius(radius: 4)
    }
    
}
