//
//  ViewController.swift
//  homeworkAPI2
//
//  Created by Aida Moldaly on 29.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let networkManager = NetworkManager.shared
    
    @IBOutlet var personLabel: UILabel!
    
    @IBAction func getInfoButtonTapped(_ sender: UIButton) {
        networkManager.loadPersonInfo { [weak self] result in
            switch result {
            case let .success(person):
                self?.personLabel.text = person.name?.first?.first
            case let .failure(error):
                print(error.localizedDescription)
        }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        let urlString = ""
//
//        guard let url = URL(string: urlString) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                print(error)
//                return
//            }
//
//            guard let data = data else {
//                return
//            }
//
//
//            do{
//                let people = try JSONDecoder().decode([Person].self, from: data)
//                print(people.first?.name?.first?.first)
//            } catch {
//                print(error)
//            }
//
//        }
//        .resume()
    }

}

