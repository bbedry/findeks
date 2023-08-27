//
//  TradeViewController.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 12.08.2023.
//

import UIKit
import Charts

struct CurrencyData {
    let first : String?
    let second : String?
}

@available(iOS 13.0, *)
class TradeViewController: UIViewController, ChartViewDelegate {

    @IBOutlet weak var tradingTableView: UITableView!
    @IBOutlet weak var convertCurrencyCollectionView: UICollectionView!
    @IBOutlet weak var barChartView: BarChartView!
    
    
    var currencyData = [CurrencyData(first: "EUR", second: "TRY"),
                        CurrencyData(first: "BTC", second: "EUR"),
                        CurrencyData(first: "EUR", second: "USD"),
                        CurrencyData(first: "ADA", second: "DOGE"),
                        CurrencyData(first: "GBP", second: "USD"),
                        CurrencyData(first: "EUR", second: "GBP"),
                        CurrencyData(first: "SHRT", second: "TRY")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        barChartView.delegate = self
        setupViewDelegates()
        // Do any additional setup after loading the view.
    }

    func setupViewDelegates() {
        convertCurrencyCollectionView.delegate = self
        convertCurrencyCollectionView.dataSource = self
        convertCurrencyCollectionView.register(ConvertCurrencyCollectionCell.self)
        
        tradingTableView.dataSource = self
        tradingTableView.delegate = self
        tradingTableView.register(SegmentControllerTableViewCell.self)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        var entries = [BarChartDataEntry]()
        
        for x in 0..<10 {
            entries.append(BarChartDataEntry(x: Double(x), y: Double(x)))
        }
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.liberty()
        
        let data = BarChartData(dataSet: set)
        
        barChartView.data = data
    }

}

@available(iOS 13.0, *)
extension TradeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currencyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ConvertCurrencyCollectionCell.self), for: indexPath) as? ConvertCurrencyCollectionCell else { return UICollectionViewCell()}
        if indexPath.row != 0 {
            cell.bottomView.isHidden = true
        }
        cell.currency = currencyData[indexPath.row]
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 73, height: 35)
        }
    
    
}

@available(iOS 13.0, *)
extension TradeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SegmentControllerTableViewCell.self), for: indexPath) as? SegmentControllerTableViewCell else { return UITableViewCell()}
        
        return cell
    }
    
    
}
