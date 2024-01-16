//
//  PortfolioViewController.swift
//  Fin_dex
//
//  Created by Bedri Doğan on 12.08.2023.
//

import UIKit

class PortfolioViewController: UIViewController, LoadingShowable {

    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var currencyTableView: UITableView!
    @IBOutlet weak var accountsCollectionViews: UICollectionView!
    
   
    var currenciesVM = AllCurrenciesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showLoading()
        self.initializeDelegates()
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchLastestCurrencies()
    }
    
    
    private func fetchLastestCurrencies() {
        DispatchQueue.main.async {
            
            self.currenciesVM.requestAllCurrencies()
            self.currenciesVM.didSuccess = {
                print("success")
                self.currencyTableView.reloadData()
                self.hideLoading()
            }
        }
        
    }
    
    @IBAction func tappedSettingsButton(_ sender: UIButton) {
        let vc = SettingsViewController()
        navigationController?.pushViewController(vc, animated: true)
        
       
        
    }
    
    func initializeDelegates() {
        currencyTableView.delegate = self
        currencyTableView.dataSource = self
        currencyTableView.register(CurrencyTableViewCell.self)
        
        accountsCollectionViews.delegate = self
        accountsCollectionViews.dataSource = self
        accountsCollectionViews.register(AccountCollectionViewCell.self)
        
      
    }
}


extension PortfolioViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currenciesVM.currencyCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: CurrencyTableViewCell.self), for: indexPath) as? CurrencyTableViewCell else { return UITableViewCell()}
        if indexPath.row == 0 {
            cell.topView.isHidden = true
        }
        let model = currenciesVM.getCurrenciesItem(index: indexPath.row)
        cell.currenciesData = model
        
        return cell
    }
    
    
}

extension PortfolioViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: AccountCollectionViewCell.self), for: indexPath) as? AccountCollectionViewCell else { return UICollectionViewCell()
            }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.frame.width / 2) * 1.7
        let height: CGFloat = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
    
    
}


