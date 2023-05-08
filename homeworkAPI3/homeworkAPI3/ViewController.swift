//
//  ViewController.swift
//  homeworkAPI3
//
//  Created by tamzimun on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager.shared
    
    @IBOutlet var modelLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func modelInfoButtonTapped(_ sender: UIButton) {
        networkManager.loadPersonInfo { [weak self] result in
            switch result {
            case let .success(model):
                self?.modelLabel.text = "\(model.shapes?.first?.data?.first?.height)" 
            case let .failure(error):
                print(error.localizedDescription)
        }
        }
    }
    
}

