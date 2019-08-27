//
//  MenuController.swift
//  SidebarMenu
//
//  Created by Simon Ng on 2/2/15.
//  Copyright (c) 2015 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseUI
import FirebaseDatabase

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedIndex = 0
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblBuild: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdentifier = "cell"
    let items: [String] = ["Home", "Cart", "My order", "Setting", "Help", "Logout"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.tableView.tableFooterView = UIView()
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.navigationController?.navigationBar.isHidden = true
        
        let version = Bundle.main.infoDictionary!["CFBundleShortVersionString"]!
        let build = Bundle.main.infoDictionary!["CFBundleVersion"]!
        lblBuild.text = "Version: \(version) & Build: \(build)"
        
        profileImage?.layer.cornerRadius = (profileImage?.frame.size.width ?? 0.0) / 2
        profileImage?.clipsToBounds = true
        profileImage?.layer.borderWidth = 1.0
        profileImage?.layer.borderColor = UIColor.white.cgColor
        
        let fName = UserDefaults.standard.value(forKey: "firstName") as! String
        let lName = UserDefaults.standard.value(forKey: "lastname") as! String
        
        lblUserName.text =  fName + " " + lName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 46
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle = .none
        cell.textLabel?.textColor = .white
        
        if(indexPath.row == 0) {
            cell.imageView?.image = UIImage(named: "home")
        } else if(indexPath.row == 1) {
            cell.imageView?.image = UIImage(named: "home")
        } else if(indexPath.row == 2) {
            cell.imageView?.image = UIImage(named: "home")
        } else if(indexPath.row == 3) {
            cell.imageView?.image = UIImage(named: "home")
        } else if(indexPath.row == 4) {
            cell.imageView?.image = UIImage(named: "home")
        } else if(indexPath.row == 5) {
            cell.imageView?.image = UIImage(named: "home")
        }
        cell.imageView?.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        cell.textLabel?.text = self.items[indexPath.row]
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (self.items[indexPath.row] == "Home") {
            if(selectedIndex == indexPath.row){
                self.revealViewController().revealToggle(animated: true)
            } else {
                selectedIndex = indexPath.row
                let homeNavigationController:UINavigationController
                let home = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:  "MainViewController")as! MainViewController
                homeNavigationController =  UINavigationController(rootViewController: home)
                self.revealViewController().setFront(homeNavigationController, animated: true)
                homeNavigationController.navigationBar.barTintColor = .init(red: 13.0/255, green: 147.0/255, blue: 71.0/255, alpha: 1.0)
                self.revealViewController().revealToggle(animated: true)
            }
        } else if (self.items[indexPath.row] == "Cart") {
            if(selectedIndex == indexPath.row){
                self.revealViewController().revealToggle(animated: true)
            } else {
                selectedIndex = indexPath.row
                let homeNavigationController:UINavigationController
                let home = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:  "CartViewController")as! CartViewController
                home.type = "Main"
                homeNavigationController =  UINavigationController(rootViewController: home)
                self.revealViewController().setFront(homeNavigationController, animated: true)
                homeNavigationController.navigationBar.barTintColor = .init(red: 13.0/255, green: 147.0/255, blue: 71.0/255, alpha: 1.0)
                self.revealViewController().revealToggle(animated: true)
            }
        } else if (self.items[indexPath.row] == "My order") {
            if(selectedIndex == indexPath.row){
                self.revealViewController().revealToggle(animated: true)
            } else {
                selectedIndex = indexPath.row
                let myOrdersNavigationController:UINavigationController
                
                let myOrders = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:  "MyOrdersViewController")as! MyOrdersViewController
                myOrdersNavigationController =  UINavigationController(rootViewController: myOrders)
                self.revealViewController().setFront(myOrdersNavigationController, animated: true)
                self.revealViewController().revealToggle(animated: true)
            }
        } else if (self.items[indexPath.row] == "Setting") {
            if(selectedIndex == indexPath.row){
                self.revealViewController().revealToggle(animated: true)
            } else {
                selectedIndex = indexPath.row
                let settingNavigationController:UINavigationController
                let settings = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:  "SettingsViewController")as! SettingsViewController
                settingNavigationController =  UINavigationController(rootViewController: settings)
                self.revealViewController().setFront(settingNavigationController, animated: true)
                self.revealViewController().revealToggle(animated: true)
            }
        } else if (self.items[indexPath.row] == "Help") {
            if(selectedIndex == indexPath.row){
                self.revealViewController().revealToggle(animated: true)
            } else {
                selectedIndex = indexPath.row
                let helpNavigationController:UINavigationController
                
                let helpViewController = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:  "HelpViewController")as! HelpViewController
                helpNavigationController =  UINavigationController(rootViewController: helpViewController)
                self.revealViewController().setFront(helpNavigationController, animated: true)
                self.revealViewController().revealToggle(animated: true)
            }
        } else if (self.items[indexPath.row] == "Logout") {
            moveToLoginScreen()
        }
    }
    
    func moveToLoginScreen(){
        UserDefaults.standard.setValue(nil, forKey: "phoneNumber")
        UserDefaults.standard.setValue(nil, forKey: "uid")
        
        let login = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier:  "ViewController")as! ViewController
        self.revealViewController().revealToggle(animated: true)
        
        let loginNavigationController:UINavigationController
        loginNavigationController =  UINavigationController(rootViewController: login)
        
        self.revealViewController().setFront(loginNavigationController, animated: true)
    }
}
