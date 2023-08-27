//
//  SegmentControllerTableViewCell.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 27.08.2023.
//

import UIKit

protocol SegmentControllerDelegate: AnyObject {
    func switchSegment(selectedndex: Int?)
}

@available(iOS 13.0, *)
class SegmentControllerTableViewCell: UITableViewCell, ReusableView, NibLoadableView {

    @IBOutlet weak var segmentController: UISegmentedControl!
    
    weak var delegate: SegmentControllerDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setupUI()
    }
    private func setupUI() {
    
        segmentController.selectedSegmentTintColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        segmentController.tintColor = AppColors.primaryLight
        segmentController.setTitleTextAttributes([.foregroundColor: AppColors.primaryDark,
                                                  NSAttributedString.Key.font: AppFonts.SfProDisplayMedium12 ?? ""], for: .normal)
        
    }
    @IBAction func tappedSegmentController(_ sender: UISegmentedControl) {
        delegate?.switchSegment(selectedndex: segmentController.selectedSegmentIndex)
    }
    
}
