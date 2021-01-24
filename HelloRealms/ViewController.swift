//
//  ViewController.swift
//  HelloRealms
//
//  Created by 副島拓哉 on 2021/01/24.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let realm = try! Realm()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textField1.placeholder = "名前を入力してください"
        textField2.placeholder = "年齢を入力してください"
        
        let userData = realm.objects(User.self)
        print("全てのデータ\(userData)")
    }

    @IBAction func addButtonAction(_ sender: Any) {
        let user = User()
        user.name = textField1.text!
        user.age = Int(textField2.text!)!
        try! realm.write {
            realm.add(user)
        }
        
        textField1.text = ""
        textField2.text = ""
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let userData = realm.objects(User.self)
        return userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let userData = realm.objects(User.self)
        cell.textLabel!.text = "\(userData[indexPath.row].name)さん"
        cell.detailTextLabel!.text = String("\(userData[indexPath.row].age)歳")
        return cell
    }
    
}

