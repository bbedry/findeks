//
//  AccountCollectionViewCell.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 12.08.2023.
//

import UIKit

class AccountCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var amountValue: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var cryptoImage: UIImageView!
    @IBOutlet weak var withdrawButton: UIButton!
    @IBOutlet weak var depositButton: UIButton!
    @IBOutlet weak var depositBgView: UIView!
    @IBOutlet weak var withdrawBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    
    func setupUI() {
        
        DispatchQueue.main.async {
            self.containerView.addGradientBackground(firstColor: .purple, secondColor: .blue)
        
            }
        
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = false
       
        depositBgView.layer.cornerRadius = 4
        depositBgView.layer.masksToBounds = true
        depositBgView.backgroundColor = UIColor(white: 1, alpha: 0.5)
        
        withdrawBgView.layer.cornerRadius = 4
        withdrawBgView.layer.masksToBounds = true
        withdrawBgView.backgroundColor = UIColor(white: 1, alpha: 0.5)
    
        
    }

}
