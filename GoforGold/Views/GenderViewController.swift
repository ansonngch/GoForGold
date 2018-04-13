//
//  AgeViewController.swift
//  GoforGold
//
//  Created by Anson Ng on 23/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

protocol GenderProtocol
{
    func setGender(gender: String, index: Int)
}


class GenderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var index: Int?
    let cellId = "cellid"
    let genderArray = [Constants.sharedInstance.genderList.m, Constants.sharedInstance.genderList.f]
    var genderProtocol: GenderProtocol?
    
    let tableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        navigationItem.hidesBackButton = true
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genderArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = genderArray[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gender = genderArray[indexPath.item]
        guard let rowIndex = index else { return }
        genderProtocol?.setGender(gender: gender, index: rowIndex)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}



