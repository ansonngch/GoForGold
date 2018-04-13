//
//  AgeViewController.swift
//  GoforGold
//
//  Created by Anson Ng on 23/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

protocol AgeProtocol
{
    func setAge(age: String, ageGroup: Int, index: Int)
}


class AgeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var index: Int?
    let cellId = "cellid"
    let ageGroupArray = ["<22", "22-24", "25-27", "28-30", "31-33", "34-36", "37-39", "40-42", "43-45", "46-48", "49-51", "52-54", "55-57", "58-60"]
    var ageProtocol: AgeProtocol?
    
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
        return ageGroupArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = ageGroupArray[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let age = ageGroupArray[indexPath.item]
        print (age)
        guard let rowIndex = index else { return }
        ageProtocol?.setAge(age: age, ageGroup: indexPath.item, index: rowIndex)
        self.navigationController?.popViewController(animated: true)
    }
    
    
}


