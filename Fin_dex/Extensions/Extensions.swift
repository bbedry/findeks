//
//  Extensions.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 12.08.2023.
//

import UIKit

extension UIView{
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor){
            clipsToBounds = true
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
            gradientLayer.frame = self.bounds
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0, y: 1)
            print(gradientLayer.frame)
            self.layer.insertSublayer(gradientLayer, at: 0)
        }
    }
