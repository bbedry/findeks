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
    
        segmentController.selectedSegmentTintColor = UIColor(red: 23, green: 23, blue: 26, alpha: 1)
        segmentController.tintColor = UIColor.init(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1.0)
        segmentController.setTitleTextAttributes([.foregroundColor: UIColor(red: 185, green: 193, blue: 217, alpha: 1),
                                                  NSAttributedString.Key.font: AppFonts.SfProDisplayMedium12 ?? ""], for: .normal)
        
    }
    @IBAction func tappedSegmentController(_ sender: UISegmentedControl) {
        delegate?.switchSegment(selectedndex: segmentController.selectedSegmentIndex)
    }
    
}
