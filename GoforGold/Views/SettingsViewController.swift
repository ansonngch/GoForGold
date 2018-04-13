//
//  SettingsViewController.swift
//  GoforGold
//
//  Created by Anson Ng on 22/2/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AgeProtocol, GenderProtocol, StatusProtocol, VocationProtocol {
    
    let tableView: UITableView = {
        let tv = UITableView()
        
        return tv
    }()
    
    var profileC = ProfileCell()
    let profileCell = "profileCell"
    let personnel = Personnel()
    let profileArray = ["Age Group", "Gender", "Service Status", "Vocation"]
    var valueArray = ["", "", "", ""]
    
    //MARK: - viewLoading
    /***************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let gender1 = UserDefaults.standard.value(forKey: "gender") as? String else { return }
        guard let ageGroup1 = UserDefaults.standard.value(forKey: "agegroup") as? Int else { return }
        guard let age1 = UserDefaults.standard.value(forKey: "age") as? String else { return }
        guard let vocation1 = UserDefaults.standard.value(forKey: "vocation") as? String else { return }
        guard let status1 = UserDefaults.standard.value(forKey: "status") as? String else { return }
        
        personnel.gender = gender1
        personnel.ageGroup = ageGroup1
        personnel.vocation = vocation1
        personnel.status = status1
        personnel.age = age1
        
        valueArray[0] = personnel.age
        valueArray[1] = personnel.gender
        valueArray[2] = personnel.status
        valueArray[3] = personnel.vocation
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ProfileCell.self, forCellReuseIdentifier: profileCell)
        
        view.addSubview(tableView)
        tableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .zero)
    }
    
    //MARK: - tableview methods
    /***************************************************************/
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return profileArray.count
        case 1:
            return 3
        case 2:
            return 1
        case 3:
            return 3
        case 4:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            profileC = tableView.dequeueReusableCell(withIdentifier: profileCell, for: indexPath) as! ProfileCell
            profileC.leftLabel.text = profileArray[indexPath.item]
            profileC.rightLabel.text = valueArray[indexPath.item]
            return profileC
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0 :
                let ageVC = AgeViewController()
                ageVC.ageProtocol = self
                ageVC.index = indexPath.row
                navigationController?.pushViewController(ageVC, animated: true)
                
            case 1 :
                let genderVc = GenderViewController()
                genderVc.genderProtocol = self
                genderVc.index = indexPath.row
                navigationController?.pushViewController(genderVc, animated: true)
            case 2 :
                let statusVC = StatusViewController()
                statusVC.statusProtocol = self
                statusVC.index = indexPath.row
                navigationController?.pushViewController(statusVC, animated: true)
            case 3 :
                let vocationVc = VocationViewController()
                vocationVc.vocationProtocol = self
                vocationVc.index = indexPath.row
                navigationController?.pushViewController(vocationVc, animated: true)
            default:
                print("nil")
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Profile"
        } else if section == 1 {
            return "Standards"
        } else if section == 3 {
            return "About"
        } else if section == 4 {
            return "Version 1.0"
        }
        return "Hi"
    }
    
    //MARK: - Protocol functions
    /***************************************************************/

    func setAge(age: String, ageGroup: Int, index: Int) {
        valueArray[index] = age
        UserDefaults.standard.set(ageGroup, forKey: "agegroup")
        UserDefaults.standard.set(age, forKey: "age")
        tableView.reloadData()
    }

    func setGender(gender: String, index: Int) {
        valueArray[index] = gender
        UserDefaults.standard.set(gender, forKey: "gender")
        tableView.reloadData()
    }

    func setVocation(vocation: String, type: String, index: Int) {
        valueArray[index] = vocation
        UserDefaults.standard.set(type, forKey: "vocation")
        tableView.reloadData()
    }
    
    func setStatus(status: String, type: String, index: Int) {
        valueArray[index] = status
        UserDefaults.standard.set(type, forKey: "status")
        tableView.reloadData()
    }

}
















