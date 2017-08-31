//
//  MultipleChoiceViewController.swift
//  UMQuery
//
//  Created by umiao on 17/4/11.
//  Copyright © 2017年 umiao. All rights reserved.
//

import UIKit

private struct config{
    static let headerViewH: CGFloat = 480.0
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
}

//["pageNo":1,"pageTitle":"1、下列选项中，哪一选项的行为构成信用卡诈骗罪？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]]
class MultipleChoiceViewController: UIViewController {
    let datadic1:[String:Any] = ["pageNo":1,"pageTitle":"1、下列选项中，哪一选项的行为构成信用卡诈骗罪？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]] as [String : Any]
    
    let datadic2:[String:Any] = ["pageNo":2,"pageTitle":"2、下列选项中，哪一选项的行为构成信用卡诈骗罪？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]] as [String:Any]
    
    var  dataSourceArray:Array = [["pageNo":1,"pageTitle":"1、下列选项中，哪一选项的行为构成信用卡诈骗罪？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]] as [String : Any],["pageNo":2,"pageTitle":"2、下列选项中，哪一选项的行为构成信用卡诈骗罪？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]] as [String:Any],["pageNo":3,"pageTitle":"3、下列选项中，哪一选项的何种行为具有法律效力？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]] as [String:Any]]
    
    
    var pageCount:Int = 0
    fileprivate let scrollView = UIScrollView(frame:CGRect(x: 0, y: 49, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    /// 点击手势
    private var tap:UITapGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        pageCount = dataSourceArray.count
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
extension MultipleChoiceViewController:UIScrollViewDelegate,MultipleChoiceViewDelegate{
    fileprivate func setupUI(){
        automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: config.screenWidth * CGFloat(pageCount), height: 0)
        // 点击手势
      
        self.view.addSubview(scrollView)
        
        
        for i in 0..<pageCount {
        let pageView = MultipleChoiceView(frame: CGRect(x: config.screenWidth * CGFloat(i), y: 0, width: config.screenWidth, height: config.headerViewH))
            pageView.delegate = self
            pageView.data = dataSourceArray[i] as! NSDictionary
            scrollView.addSubview(pageView)
        }
       
    }
    
    func confirmPageSelection(view: MultipleChoiceView, pageIndex index: NSInteger, choiceAction selectedIndex: NSInteger) {
        print(index)
        
        if index == pageCount{
            let viewController = UIAlertController(title:"Title alert", message: "The last page!", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "cancle", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: .default) { (acion) in
                print("ok click")
            }
            viewController.addAction(cancelAction)
            viewController.addAction(okAction)
            self.present(viewController, animated: true, completion: nil)
            
            return
            
            
        }
        scrollView.setContentOffset(CGPoint(x:config.screenWidth * CGFloat(index),y:0), animated: true)
    }
    
}
