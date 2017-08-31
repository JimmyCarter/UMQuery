//
//  DemoTableViewController.swift
//  UMQuery
//
//  Created by umiao on 17/4/17.
//  Copyright © 2017年 umiao. All rights reserved.
//

import UIKit
private struct config{
    static let screenW = UIScreen.main.bounds.width
    static let screenH = UIScreen.main.bounds.height
}
class DemoTableViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    fileprivate lazy var table:UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 0, width: config.screenW, height: config.screenH))
        table.rowHeight = 40
        table.dataSource = self
        table.delegate = self
        return table
    }()

  }
extension DemoTableViewController{
    fileprivate func setupUI(){
        table.showsVerticalScrollIndicator = true
        view.addSubview(table)
    }
}
extension DemoTableViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
               }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
//        cell.titleLabel.text = "1"
//        cell.contentLabel.text = "2"
        cell.textLabel?.text = "11"
        return cell
        

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
}
