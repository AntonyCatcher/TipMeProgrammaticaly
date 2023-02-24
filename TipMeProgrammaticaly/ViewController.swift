//
//  ViewController.swift
//  TipMeProgrammaticaly
//
//  Created by Anton  on 23.02.2023.
//

import UIKit

class ViewController: UIViewController {

    private let mainView = MainView()
   // private let tipsModel = TipsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        addConstraints()
    //    setupKeybordHidding()
    }

}

extension ViewController {

    func setupViews() {
        view.setupView(mainView)
    }

    func addConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}


