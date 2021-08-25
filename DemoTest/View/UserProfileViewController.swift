//
//  UserProfileViewController.swift
//  DemoTest
//
//  Created by Reetika Sharma on 23/08/21.
//

import UIKit

class UserProfileViewController: UIViewController {
    
    //MARK: OUTLETS
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btnLive: UIButton!
    
    //MARK: VARIABLES
    var viewModel = ProfileViewModel()
    var userdata:UserQueryData?
    var profileData:[UserQueryData] = []
    
    //MARK: VIEWLIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        getProfileData()
    }
    
    //MARK: FUNCTIONS
    func getProfileData() {
        viewModel.request { [weak self] (result) in
            switch result{
            case .success(let profileData):
                self?.profileData = profileData!.data
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

//MARK: TABLEVIEW DELEGATE AND DATASOURCE
extension UserProfileViewController:UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: profileInfoCell, for: indexPath) as! ProfileInfoTableViewCell
        cell.configureCell(userProfileData: profileData[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
