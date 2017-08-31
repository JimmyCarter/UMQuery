//
//  FillInBlankViewController.swift
//  UMQuery
//
//  Created by umiao on 17/4/11.
//  Copyright © 2017年 umiao. All rights reserved.
//

import UIKit

class FillInBlankViewController: UIViewController {
    fileprivate var fillinblankView = FillInBlankView()
    fileprivate var dataSource: Array<String> = ["伪造的信用卡", "诈骗罪", "真实有效的", "信用卡诈骗罪", "虚假的信用卡"]
    fileprivate lazy var titleStr =  "以'使用'信用卡作为行为方式而构成信用卡诈骗罪的行为对象为____、作废的信用卡、以虚假身份证明骗领的信用卡。行为人使用伪造的信用卡作质押骗取钱财的，构成____。\r以'冒用'信用卡作为行为方式而构成信用卡诈骗罪的行为对象为____信用卡（含借记卡）、信用卡信息资料。"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
extension FillInBlankViewController{
    fileprivate func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        fillinblankView.frame = CGRect(x: 0, y: kNavBarH, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - kNavBarH)
        fillinblankView.titleStr = titleStr
        fillinblankView.arrayTitles = dataSource
        fillinblankView.maxCount = 3
        view.addSubview(fillinblankView)
    }
}
