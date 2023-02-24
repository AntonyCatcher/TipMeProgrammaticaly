//
//  MainView.swift
//  TipMeProgrammaticaly
//
//  Created by Anton  on 23.02.2023.
//

import UIKit
import SwiftUI

final class MainView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       // billTextField.delegate = self
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var totalBillLabel: UILabel = {
        let billLabel = UILabel()
        billLabel.text = Res.Text.billLabel
        //billLabel.textAlignment = .center
        billLabel.font = UIFont.setupHelvetica(size: 25)
        billLabel.textColor = Res.Color.textGrayColor
        return billLabel
    }()
    
    private lazy var billTextField: UITextField = {
        let textField = UITextField()
        textField.returnKeyType = .done
        textField.backgroundColor = .white
        textField.layer.borderColor = UIColor.systemGray.cgColor
        textField.textAlignment = .center
        textField.placeholder = Res.Text.billHint
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 2
        textField.keyboardType = .decimalPad
        textField.addDoneButtonTo(textField)
        return textField
    }()
    
    private lazy var billStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.layer.cornerRadius = 10
        return stack
    }()
    
    private lazy var bottomview: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        
        
        return view
    }()
    
    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = Res.Text.tipLabel
        label.textAlignment = .center
        label.font = UIFont.setupHelvetica(size: 25)
        label.textColor = Res.Color.textGrayColor
        return label
    }()
    
    private lazy var tipsSegmentedControl: UISegmentedControl = {
        let tips = UISegmentedControl(items: ["0%", "10%", "20%"])
        tips.selectedSegmentTintColor = Res.Color.segmentBackground
        let whiteColor = [NSAttributedString.Key.foregroundColor: UIColor.white]
        let blackColor = [NSAttributedString.Key.foregroundColor: UIColor.black]
        tips.setTitleTextAttributes(whiteColor, for: .selected)
        tips.setTitleTextAttributes(blackColor, for: .normal)
        tips.selectedSegmentIndex = 0
        return tips
    }()
    
    private lazy var splitLabel: UILabel = {
        let split = UILabel()
        split.text = Res.Text.splitLabel
        split.font = UIFont.setupHelvetica(size: 25)
        split.textAlignment = .center
        split.textColor = Res.Color.textGrayColor
        return split
    }()
    
    private lazy var people: UILabel = {
        let people = UILabel()
        people.text = "2"
        people.textAlignment = .center
        people.font = UIFont.setupHelvetica(size: 25)
        people.backgroundColor = Res.Color.segmentBackground
        people.layer.cornerRadius = 5
        people.clipsToBounds = true
        people.textColor = .white
        return people
    }()
    
    private lazy var stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.autorepeat = true
        stepper.maximumValue = 25
        stepper.minimumValue = 2
       // stepper.addTarget(self, action: #selector(changeStepperValue), for: .valueChanged)
        return stepper
    }()
    
    private lazy var spliteStack: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fill
        stack.spacing = 5
        stack.alignment = .center
        return stack
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(Res.Text.calculateButton, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Res.Color.segmentBackground
        button.layer.cornerRadius = 15
      //  button.addTarget(nil, action: #selector(MainViewController.calculateTips), for: .touchUpInside)
        return button
    }()
}

//extension MainView: UITextFieldDelegate {
//
//    @objc func changeStepperValue(_ sender: UIStepper) {
//        people.text = "\(Int(sender.value))"
//    }
//
//    func getNumberOfPeople() -> Double {
//        stepper.value
//    }
//
//    func getBillAmount() -> Double {
//        guard let billString = billTextField.text else { return 0.0 }
//        guard let bill = Double(billString) else { return 0.0 }
//        return bill
//    }
//
//    func getChoosenTips() -> Int {
//        let index = tipsSegmentedControl.selectedSegmentIndex
//        switch index {
//        case 0: return 0
//        case 1: return 10
//        case 2: return 20
//        default: return 0
//        }
//    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        billTextField.resignFirstResponder()
//    }
//
//    func emptyTextField() {
//        billTextField.text = nil
//    }
//
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        super .touchesBegan(touches, with: event)
//        endEditing(true)
//    }
//}

extension MainView {
    
    func setupViews() {
        setupView(billStackView)
       // billStackView.addArrangedSubview(totalBillLabel)
       // billStackView.addArrangedSubview(billTextField)
        [totalBillLabel, billTextField].forEach(billStackView.addArrangedSubview)
        
        setupView(bottomview)
        //[tipLabel, tipsSegmentedControl, splitLabel, spliteStack, people, stepper].forEach(bottomview.addSubviews)
        bottomview.addSubviews(tipLabel, tipsSegmentedControl, splitLabel, spliteStack)
        [people, stepper].forEach(spliteStack.addArrangedSubview)
        
        //totalBillLabel.backgroundColor = .systemGreen
        
        
        
//        setupView(tipLabel)
//        setupView(tipsSegmentedControl)
//        setupView(splitLabel)
//        setupView(spliteStack)
//        [people, stepper].forEach(spliteStack.addArrangedSubview)
        setupView(calculateButton)
        
        //billStackView.backgroundColor = .systemRed
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            billStackView.topAnchor.constraint(equalTo: topAnchor),
            billStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            billStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            billStackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15), // 15 % от высоты экрана
            
            totalBillLabel.leadingAnchor.constraint(equalTo: billStackView.leadingAnchor, constant: 70),
            totalBillLabel.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor, constant: -300),
            billTextField.leadingAnchor.constraint(equalTo: billStackView.leadingAnchor, constant: 50),
            billTextField.trailingAnchor.constraint(equalTo: billStackView.trailingAnchor, constant: -50),
            
            bottomview.topAnchor.constraint(equalTo: billStackView.bottomAnchor, constant: 10),
            bottomview.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomview.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomview.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            tipLabel.topAnchor.constraint(equalTo: bottomview.topAnchor, constant: 30),
            tipLabel.leadingAnchor.constraint(equalTo: bottomview.leadingAnchor),
            tipLabel.trailingAnchor.constraint(equalTo: bottomview.trailingAnchor),
            tipLabel.heightAnchor.constraint(equalToConstant: 30),
            
            tipsSegmentedControl.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -500),
            tipsSegmentedControl.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            tipsSegmentedControl.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50),
            tipsSegmentedControl.heightAnchor.constraint(equalToConstant: 50),
            
            splitLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -400),
            splitLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50),
            splitLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            
            spliteStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -340),
            spliteStack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 100),
            spliteStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -100),
            
            people.heightAnchor.constraint(equalToConstant: 50),
            stepper.heightAnchor.constraint(equalToConstant: 30),
            
            calculateButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            calculateButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -50),
            calculateButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 50)
            
        
            
 
        ])
    }
}

