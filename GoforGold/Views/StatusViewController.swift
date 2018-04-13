//
//  AgeViewController.swift
//  GoforGold
//
//  Created by Anson Ng on 23/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

protocol StatusProtocol
{
    func setStatus(status: String, type: String, index: Int)
}


class StatusViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var index: Int?
    let cellId = "cellid"
    let statusArray = [Constants.sharedInstance.statusList.nsf, Constants.sharedInstance.statusList.nsm]
    var statusProtocol: StatusProtocol?
    
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
        return statusArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = statusArray[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let status = statusArray[indexPath.item]
        var type = Constants.sharedInstance.statusList.nsf
        guard let rowIndex = index else { return }
        switch indexPath.item {
        case 1:
            type = Constants.sharedInstance.statusList.nsm
        default:
            type = Constants.sharedInstance.statusList.nsf
        }
        statusProtocol?.setStatus(status: status, type: type, index: rowIndex)
        navigationController?.popViewController(animated: true)
    }
    
    
}




