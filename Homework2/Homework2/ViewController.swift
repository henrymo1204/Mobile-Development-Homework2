//
//  ViewController.swift
//  Homework2
//
//  Created by Henry mo on 11/21/20.
//  Copyright © 2020 Henry mo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    let statusMessage = UILabel()
    var vals = [UITextField]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let vGenerator = ClaimDetailSectionGenerator()
        let sView = vGenerator.generate()
        view.addSubview(sView)
        
        let bStackView = UIStackView()
        bStackView.spacing = 20
        button.setTitle("Add", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(add(_:)), for: .touchUpInside)
        bStackView.addArrangedSubview(button)
        view.addSubview(bStackView)
        
        let cViews = sView.arrangedSubviews
        for sv in cViews {
            let innerStackView = sv as! UIStackView
            for ve in innerStackView.arrangedSubviews {
                if ve is UITextField {
                    vals.append(ve as! UITextField)
                }
            }
        }
        
        for i in 0...vals.count-1 {
            vals[i].translatesAutoresizingMaskIntoConstraints = false
            let constr = vals[i].leadingAnchor.constraint(equalTo: vals[0].leadingAnchor)
            constr.isActive = true
        }
        
        //let sGenerator = FieldValueViewGenerator(n: "Status:")
        //let status = sGenerator.generate()
        //view.addSubview(status)
        let sStackView = UIStackView()
        sStackView.axis = .horizontal
        sStackView.spacing = 20
        let status = UILabel()
        status.text = "Status:"
        sStackView.addArrangedSubview(status)
        statusMessage.text = "<Status Message>"
        sStackView.addArrangedSubview(statusMessage)
        view.addSubview(sStackView)
        
        sView.translatesAutoresizingMaskIntoConstraints = false
        let tCont = sView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let lCont = sView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let trCont = sView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        tCont.isActive = true
        lCont.isActive = true
        trCont.isActive = true
        
        bStackView.translatesAutoresizingMaskIntoConstraints = false
        let bCnt1 = bStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let bCnt2 = bStackView.topAnchor.constraint(equalTo: sView.bottomAnchor)
        bCnt1.isActive = true
        bCnt2.isActive = true
        
        /*
        status.translatesAutoresizingMaskIntoConstraints = false
        let sCnt1 = status.topAnchor.constraint(equalTo: bStackView.bottomAnchor)
        let sCnt2 = status.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let sCnt3 = status.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        sCnt1.isActive = true
        sCnt2.isActive = true
        sCnt3.isActive = true
        */
        
        sStackView.translatesAutoresizingMaskIntoConstraints = false
        let sCnt1 = sStackView.topAnchor.constraint(equalTo: bStackView.bottomAnchor)
        let sCnt2 = sStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let sCnt3 = sStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        sCnt1.isActive = true
        sCnt2.isActive = true
        sCnt3.isActive = true    }
    
    @objc func add(_ sender : UIButton) {
        print("ADD button was clicked")
        let text1 = vals[0].text as String?
        let text2 = vals[1].text as String?
        let c = ClaimService()
        if text1! == "" && text2! == "" {
            self.statusMessage.text = "You did not enter any data"
        }
        else if text1! == "" {
            self.statusMessage.text = "You did not enter claim title"
        }
        else if text2! == "" {
            self.statusMessage.text = "You did not enter date"
        }
        else {
            let cObj = Claim(title: text1!, date: text2!)
            c.addClaim(cObj: cObj, completion: { value in
                if value {
                    self.statusMessage.text = "Claim \(text1!) was successfully created"
                    self.vals[0].text = ""
                    self.vals[1].text = ""
                }
                else {
                    self.statusMessage.text = "Claim \(text1!) failed to be created"
                }
            })
        }
    }
}

