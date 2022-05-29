//
//  ViewController.swift
//  Kanye
//
//  Created by Aida Moldaly on 28.05.2022.
//

import UIKit

class ViewController: UIViewController {
    let networkManager = NetworkManager.shared
    
    @IBOutlet var quoteLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func randomeButtonTapped(_ sender: UIButton) {
    
        networkManager.loadKanyeQuote { [weak self] result in
            switch result {
            case let .success(kanye):
                self?.quoteLabel.text = kanye.quote
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
