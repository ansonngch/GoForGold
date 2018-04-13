//
//  ViewController.swift
//  GoforGold
//
//  Created by Anson Ng on 15/1/18.
//  Copyright © 2018 Anson Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let personnel = Personnel()
    let ippt = Ippt()
    var total = 0
    var runTotal = 0
    var pushTotal = 0
    var sitTotal = 0
    
    //MARK: - Create Objects
    /***************************************************************/
    
    let rewardView: UIView = { //Indicates the reward in color
        let view = UIView()
        return view
    }()
    
    let totalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    let barTitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()
    
    let rewardLabel: UILabel = {
        let label = UILabel()
        label.text = "$100"
        label.textAlignment = .center
        label.backgroundColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 70)
        label.text = "100"
        label.textAlignment = .center
        label.backgroundColor = .white
        return label
    }()
    
    let sitUpImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "sit-up")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let sitUpLabel: UILabel = {
        let label = UILabel()
        label.text = "60"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let sitUpSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 60
        slider.value = 60
        slider.maximumTrackTintColor = UIColor.lightGray
        slider.minimumTrackTintColor = .black
        slider.addTarget(self, action: #selector(situpSliderChanged(sender:)), for: .valueChanged)
        return slider
    }()
    
    let pushUpImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "push-up")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pushUpLabel: UILabel = {
        let label = UILabel()
        label.text = "60"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let pushUpSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 60
        slider.value = 60
        slider.maximumTrackTintColor = UIColor.lightGray
        slider.minimumTrackTintColor = .black
        slider.addTarget(self, action: #selector(pushupSliderChanged(sender:)), for: .valueChanged)
        return slider
    }()
    
    let runImage: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "run")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let runLabel: UILabel = {
        let label = UILabel()
        label.text = "< 11:40"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textAlignment = .center
        return label
    }()
    
    let runSlider: UISlider = {
        let slider = UISlider()
        slider.minimumValue = 510
        slider.maximumValue = 1100
        slider.value = 690
        slider.minimumTrackTintColor = UIColor.lightGray
        slider.maximumTrackTintColor = .black
        slider.transform = CGAffineTransform(scaleX: -1, y: 1)
        slider.addTarget(self, action: #selector(runSliderChanged(sender:)), for: .valueChanged)
        return slider
    }()
    
    
    //MARK: - Setup Objects
    /***************************************************************/
    
    fileprivate func setupNavigationButtons() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "gear").withRenderingMode(.alwaysOriginal), style: .plain, target: self  , action: #selector(toSettingsPage))
    }
    
    fileprivate func setupHeaders() {
        view.addSubview(rewardView)
        rewardView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 3))

        view.addSubview(totalView)
        totalView.anchor(top: rewardView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .zero, size: .init(width: 0, height: 150))
        
        let headerView = UIStackView(arrangedSubviews: [rewardLabel, totalLabel])
        headerView.distribution = .fillEqually
        
        totalView.addSubview(headerView)
        headerView.anchor(top: totalView.topAnchor, leading: totalView.leadingAnchor, bottom: totalView.bottomAnchor, trailing: totalView.trailingAnchor)
    }
    
    fileprivate func updateRewardLabel(reward: String, award: String) {
        let attributedText = NSMutableAttributedString(string: reward, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 35) ])
        
        attributedText.append(NSMutableAttributedString(string: "\n\(award)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 35)]))
        
        rewardLabel.attributedText = attributedText
    }
    
    fileprivate func setupBody() {
        
        let situpStackView1 = UIStackView(arrangedSubviews: [sitUpImage, sitUpLabel, UIView()])
        situpStackView1.distribution = .fillEqually
        let situpStackView = UIStackView(arrangedSubviews: [situpStackView1, sitUpSlider])
        situpStackView.axis = .vertical
        situpStackView.distribution = .fillEqually
        
        let pushupStackView1 = UIStackView(arrangedSubviews: [pushUpImage, pushUpLabel, UIView()])
        pushupStackView1.distribution = .fillEqually
        let pushupStackView = UIStackView(arrangedSubviews: [pushupStackView1, pushUpSlider])
        pushupStackView.axis = .vertical
        pushupStackView.distribution = .fillEqually
        
        let runStackView1 = UIStackView(arrangedSubviews: [runImage, runLabel, UIView()])
        runStackView1.distribution = .fillEqually
        let runStackView = UIStackView(arrangedSubviews: [runStackView1, runSlider])
        runStackView.axis = .vertical
        runStackView.distribution = .fillEqually
        
        let bodyStackView = UIStackView(arrangedSubviews: [situpStackView, pushupStackView, runStackView])
        bodyStackView.axis = .vertical
        bodyStackView.distribution = .fillEqually
        
        view.addSubview(bodyStackView)
        
        bodyStackView.anchor(top: totalView.bottomAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 20, bottom: 0, right: 20))
        
    }
    
    //MARK: - viewLoading
    /***************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupNavigationButtons()
        setupHeaders()
        setupBody()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print(total)
        
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
        
        barTitleLabel.text = "\(personnel.age), \(personnel.gender) \n \(personnel.status), \(personnel.vocation)"
        self.navigationItem.titleView = barTitleLabel
        
        if let sitValue1 = UserDefaults.standard.value(forKey: "sitValue") as? String,
            let pushValue1 = UserDefaults.standard.value(forKey: "pushValue") as? String,
            let runValue1 = UserDefaults.standard.value(forKey: "runValue") as? String {
            
            
            guard let sitValue = Float(sitValue1),
                let pushValue = Float(pushValue1),
                let runValue = Float(runValue1) else { return }
            
            getSitScore(value: Int(sitValue))
            getPushScore(value: Int(pushValue))
            getRunScore(value: Int(runValue))
            
            sitUpSlider.value = sitValue
            sitUpLabel.text = sitValue1
            pushUpSlider.value = pushValue
            pushUpLabel.text = pushValue1
            runSlider.value = runValue
            runLabel.text = "< \(secondsToMinutes(seconds: runValue))"
            
            if let sitTotal1 = UserDefaults.standard.value(forKey: "sitTotal") as? String,
                let pushTotal1 = UserDefaults.standard.value(forKey: "pushTotal") as? String,
                let runTotal1 = UserDefaults.standard.value(forKey: "runTotal") as? String {
                
                guard let sitTotalX = Int(sitTotal1),
                    let pushTotalX = Int(pushTotal1),
                    let runTotalX = Int(runTotal1) else { return }
                
                sitTotal = sitTotalX
                pushTotal = pushTotalX
                runTotal = runTotalX
                
                total = sitTotal + pushTotal + runTotal
                
                totalLabel.text = "\(total)"
                
                updateRewards()
            } else {
                
            }
            
        } else {
            
        }
    }
    
    //MARK: - To Settings Page
    /***************************************************************/
    
    @objc func toSettingsPage() {
        let settingVC = SettingsViewController()
        navigationController?.pushViewController(settingVC, animated: true)
    }

    //MARK: - Functions to update results
    /***************************************************************/
    fileprivate func getSitScore(value: Int){
        sitTotal = 0
        if personnel.gender == Constants.sharedInstance.genderList.m{
            if personnel.status == Constants.sharedInstance.statusList.nsf {
                guard let sitArray = ippt.maleSitUpScores["\(value)"] else { return }
                guard let sitScore = Int(sitArray[0]) else { return }
                sitTotal += sitScore
            } else {
                guard let sitArray = ippt.maleSitUpScores["\(value)"] else { return }
                guard let sitScore = Int(sitArray[personnel.ageGroup]) else { return }
                sitTotal += sitScore
            }
        } else {
            
        }
        UserDefaults.standard.set("\(sitTotal)", forKey: "sitTotal")
        UserDefaults.standard.set("\(value)", forKey: "sitValue")
        
        updateTotalLabel(pTotal: nil, sTotal: sitTotal, rTotal: nil)
    }
    
    fileprivate func getPushScore(value:Int){
        pushTotal = 0
        if personnel.gender == Constants.sharedInstance.genderList.m{
            if personnel.status == Constants.sharedInstance.statusList.nsf {
                guard let pushArray = ippt.malePushUpScores["\(value)"] else { return }
                guard let pushScore = Int(pushArray[0]) else { return }
                pushTotal += pushScore
            } else {
                guard let pushArray = ippt.malePushUpScores["\(value)"] else { return }
                guard let pushScore = Int(pushArray[personnel.ageGroup]) else { return }
                pushTotal += pushScore
            }
        } else {
            
        }
        UserDefaults.standard.set("\(pushTotal)", forKey: "pushTotal")
        UserDefaults.standard.set("\(value)", forKey: "pushValue")
        
        
        updateTotalLabel(pTotal: pushTotal, sTotal: nil, rTotal: nil)
    }
    
    fileprivate func getRunScore(value: Int) {
        runTotal = 0
        if personnel.gender == Constants.sharedInstance.genderList.m{
            if personnel.status == Constants.sharedInstance.statusList.nsf {
                guard let runArray = ippt.maleRunScores["\(value)"] else { return }
                guard let runScore = Int(runArray[0]) else { return }
                runTotal += runScore
            } else {
                guard let runArray = ippt.maleRunScores["\(value)"] else { return }
                guard let runScore = Int(runArray[personnel.ageGroup]) else { return }
                runTotal += runScore
            }
        } else {
            
        }
        UserDefaults.standard.set("\(runTotal)", forKey: "runTotal")
        UserDefaults.standard.set("\(value)", forKey: "runValue")
        
        
        updateTotalLabel(pTotal: nil, sTotal: nil, rTotal: runTotal)
    }
    
    //MARK: - Update results
    /***************************************************************/
    @objc func situpSliderChanged(sender: UISlider){
        sitUpLabel.text = "\(Int(sender.value))"
        getSitScore(value: Int(sender.value))
    }
    
    @objc func pushupSliderChanged(sender: UISlider){
        pushUpLabel.text = "\(Int(sender.value))"
        getPushScore(value: Int(sender.value))
        
    }
    
    @objc func runSliderChanged(sender: UISlider){
        runLabel.text = "< \(secondsToMinutes(seconds: sender.value))"
        getRunScore(value: Int(sender.value))
    }
    
    fileprivate func updateTotalLabel(pTotal: Int?, sTotal: Int?, rTotal: Int?){
        print(pushTotal, runTotal, sitTotal)
        if let pTotal = pTotal{
            total = pTotal + runTotal + sitTotal
        }
        
        if let sTotal = sTotal {
            total = pushTotal + runTotal + sTotal
        }
        
        if let rTotal = rTotal {
            total = pushTotal + rTotal + sitTotal
        }
        
        updateRewards()
        totalLabel.text = "\(total)"
    }
    
    fileprivate func updateRewards(){
        if personnel.gender == Constants.sharedInstance.genderList.m {
            if personnel.status == Constants.sharedInstance.statusList.nsf {
                if personnel.vocation == Constants.sharedInstance.vocationList.cs {
                    award(status: Constants.sharedInstance.statusList.nsf, vocation: Constants.sharedInstance.vocationList.cs, total: total)
                } else {
                    award(status: Constants.sharedInstance.statusList.nsf, vocation: Constants.sharedInstance.vocationList.nd, total: total)
                }
            } else {
                if personnel.vocation == Constants.sharedInstance.vocationList.cs {
                    award(status: Constants.sharedInstance.statusList.nsm, vocation: Constants.sharedInstance.vocationList.cs, total: total)
                } else {
                    award(status: Constants.sharedInstance.statusList.nsm, vocation: Constants.sharedInstance.vocationList.nd, total: total)
                }
            }
            
        } else {
            if personnel.status == Constants.sharedInstance.statusList.nsf {
                if personnel.vocation == Constants.sharedInstance.vocationList.cs {
                    award(status: Constants.sharedInstance.statusList.nsf, vocation: Constants.sharedInstance.vocationList.cs, total: total)
                } else {
                    award(status: Constants.sharedInstance.statusList.nsf, vocation: Constants.sharedInstance.vocationList.nd, total: total)
                }
            } else {
                if personnel.vocation == Constants.sharedInstance.vocationList.cs {
                    award(status: Constants.sharedInstance.statusList.nsm, vocation: Constants.sharedInstance.vocationList.cs, total: total)
                } else {
                    award(status: Constants.sharedInstance.statusList.nsm, vocation: Constants.sharedInstance.vocationList.nd, total: total)
                }
            }
        }
    }

    
    func award(status: String, vocation: String, total: Int){
        switch status {
        case Constants.sharedInstance.statusList.nsf :
            switch vocation {
            case Constants.sharedInstance.vocationList.cs :
                switch total {
                case 61...74:
                    updateRewardLabel(reward: "$0", award: "Pass")
                    rewardView.backgroundColor = .green
                case 75...84:
                    updateRewardLabel(reward: "$200", award: "Silver")
                    rewardView.backgroundColor = UIColor.rgb(r: 192, g: 192, b: 192)
                case 84...100:
                    updateRewardLabel(reward: "$300", award: "Gold")
                    rewardView.backgroundColor = UIColor.rgb(r: 255, g: 215, b: 0)
                default :
                    updateRewardLabel(reward: "$0", award: "Fail")
                    rewardView.backgroundColor = .red
                }
            case Constants.sharedInstance.vocationList.nd :
                switch total {
                case 61...74:
                    updateRewardLabel(reward: "$0", award: "Pass")
                    rewardView.backgroundColor = .green
                case 75...89:
                    updateRewardLabel(reward: "$200", award: "Silver")
                    rewardView.backgroundColor = UIColor.rgb(r: 192, g: 192, b: 192)
                case 90...100:
                    updateRewardLabel(reward: "$300", award: "Gold")
                    rewardView.backgroundColor = UIColor.rgb(r: 255, g: 215, b: 0)
                default :
                    updateRewardLabel(reward: "$0", award: "Fail")
                    rewardView.backgroundColor = .red
                }
            default :
                updateRewardLabel(reward: "$0", award: "Fail")
                rewardView.backgroundColor = .red
            }
        case Constants.sharedInstance.statusList.nsm :
            switch vocation {
            case Constants.sharedInstance.vocationList.cs :
                switch total {
                case 51...60:
                    updateRewardLabel(reward: "$0", award: "Pass")
                    rewardView.backgroundColor = UIColor.darkGray
                case 61...74:
                    updateRewardLabel(reward: "$200", award: "Incentive")
                    rewardView.backgroundColor = .green
                case 75...84:
                    updateRewardLabel(reward: "$300", award: "Silver")
                    rewardView.backgroundColor = UIColor.rgb(r: 192, g: 192, b: 192)
                case 85...100:
                    updateRewardLabel(reward: "$500", award: "Gold")
                    rewardView.backgroundColor = UIColor.rgb(r: 255, g: 215, b: 0)
                default :
                    updateRewardLabel(reward: "$0", award: "Fail")
                    rewardView.backgroundColor = .red
                }
            case Constants.sharedInstance.vocationList.nd :
                switch total {
                case 51...60:
                    updateRewardLabel(reward: "$0", award: "Pass")
                    rewardView.backgroundColor = UIColor.darkGray
                case 61...74:
                    updateRewardLabel(reward: "$200", award: "Incentive")
                    rewardView.backgroundColor = .green
                case 75...89:
                    updateRewardLabel(reward: "$300", award: "Silver")
                    rewardView.backgroundColor = UIColor.rgb(r: 192, g: 192, b: 192)
                case 90...100:
                    updateRewardLabel(reward: "$500", award: "Gold")
                    rewardView.backgroundColor = UIColor.rgb(r: 255, g: 215, b: 0)
                default :
                    updateRewardLabel(reward: "$0", award: "Fail")
                    rewardView.backgroundColor = .red
                }
            default :
                updateRewardLabel(reward: "$0", award: "Fail")
                rewardView.backgroundColor = .red
            }
        default :
            updateRewardLabel(reward: "$0", award: "Fail")
            rewardView.backgroundColor = .red
        }
    }
}


