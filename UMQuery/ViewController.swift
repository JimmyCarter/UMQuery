//
//  ViewController.swift
//  UMQuery
//
//  Created by umiao on 17/4/11.
//  Copyright © 2017年 umiao. All rights reserved.
//

import UIKit
import CoreData
let kNavBarH: CGFloat = 64.0
private struct QuestionsConfig{
    static let questionsCellID = "questionsCellID"
    static let questionsCellH: CGFloat = 50.0
}
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
        // Do any additional setup after loading the view, typically from a nib.
        fileprivate lazy var dataSource: Array<String> = ["选择题","填空题","判断题","Demo"]
        fileprivate lazy var table: UITableView = {
            let table = UITableView(frame:CGRect(x: 0, y: kNavBarH,width:UIScreen.main.bounds.width,height:UIScreen.main.bounds.height - kNavBarH))
            table.register(UITableViewCell.self, forCellReuseIdentifier: QuestionsConfig.questionsCellID)
            table.rowHeight = QuestionsConfig.questionsCellH
            table.separatorStyle = .none
            table.showsVerticalScrollIndicator = false
            table.delegate = self
            table.dataSource = self
            return table
            
        }()
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
    
extension ViewController{
        fileprivate func setupUI(){
            automaticallyAdjustsScrollViewInsets = false
            view.addSubview(table)
        }
    }
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionsConfig.questionsCellID, for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var vc:UIViewController?
        
        switch indexPath.row {
        case 0:
            vc = MultipleChoiceViewController()
        case 1:
            vc = TrueOrFalseViewController()
        case 2:
            vc = FillInBlankViewController()
        case 3:
            vc = DemoTableViewController()
        default:
            return
        }
        vc!.title = dataSource[indexPath.row]
        navigationController?.pushViewController(vc!, animated: true)
    }
    
}



