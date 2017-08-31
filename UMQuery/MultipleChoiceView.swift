//
//  MultipleChoiceView.swift
//  UMQuery
//
//  Created by umiao on 17/4/11.
//  Copyright © 2017年 umiao. All rights reserved.
//

import UIKit
@objc protocol MultipleChoiceViewDelegate:NSObjectProtocol{
    @objc func confirmPageSelection(view:MultipleChoiceView,pageIndex index:NSInteger,choiceAction selectedIndex:NSInteger)
}
private struct config{
    static let margin: CGFloat = 20
    static let titleLabelWidth = UIScreen.main.bounds.width - margin * 2
    static let cellH: CGFloat = 60.0
    static let headerViewH: CGFloat = 80.0
}
class MultipleChoiceView: UIView {
    var titleLabel = UILabel()
    open var data:NSDictionary!{
        didSet{
            setupUI()
        }
    }
    weak var delegate:MultipleChoiceViewDelegate?
    override init(frame:CGRect){
        super.init(frame: frame)
        
    }
    required init?(coder aDecoder:NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
   
  }
extension MultipleChoiceView{
    fileprivate func setupUI(){
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: config.headerViewH))
        titleLabel.frame = header.bounds
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left
        titleLabel.isUserInteractionEnabled = true
        header.addSubview(titleLabel)
       
        titleLabel.text = data["pageTitle"] as! String?
//        let datadic1:[String:Any] = ["pageNo":1,"pageTitle":"1、下列选项中，哪一选项的行为构成信用卡诈骗罪？","options":[["A.","B.","C.","D."],["行为人使用伪造的信用卡","行为人使用作废的信用卡","行为人以虚假身份证明骗领信用卡","行为人使用伪造的信用卡作质押骗取钱财的"]]] as [String : Any]
        let optionArray:[Any] = data["options"] as! Array
        let optionABC:[Any] = optionArray[1] as! Array
        let optionDetail:[Any] = optionArray.first as! Array
        
        
        let count:Int = 3
        for i in 0..<count{
            let lable = UILabel(frame: CGRect(x: 0.0, y: CGFloat(i)*40 + config.headerViewH, width: UIScreen.main.bounds.width, height: 40))
            lable.tag = i + 1000
            let optionText:String = optionABC[i] as! String
             let enumOtion:String = optionDetail[i] as! String
//            let optionText:String = (((data["options"] as! Array)[1] as! Array)[i] as? String)!
//            let enumOtion:String = (((data["options"] as! Array)[0] as! Array)[i] as? String)!
            lable.text = String(format: "  %@ %@", enumOtion,optionText)
            lable.isUserInteractionEnabled = true
            lable.backgroundColor = UIColor.white
            let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(MultipleChoiceView.userClick(sender:)))
            lable.addGestureRecognizer(tapGesture)
            self.addSubview(lable)

        }
        self.addSubview(header)
        
    }
    @objc private func userClick(sender: UITapGestureRecognizer) {
        
        
        let myLabel = self.viewWithTag(sender.view!.tag) as? UILabel
        let count:Int = 3
        for i in 0..<count{
            let myLabelEvery = self.viewWithTag(i+1000) as? UILabel
            myLabelEvery?.backgroundColor = UIColor.white
        }
        myLabel?.backgroundColor = UIColor.lightGray
       print(myLabel?.text ?? "")
        let index:Int = (sender.view?.tag)!
        let pageIndex = data["pageNo"] as! Int
         delegate?.confirmPageSelection(view: self, pageIndex: pageIndex, choiceAction: index)
    }
    /// 手势点击
    func clickTap(tap:UITapGestureRecognizer) {
        
        let  index:Int = (tap.view?.tag)!

        
    print(tap)
        delegate?.confirmPageSelection(view: self, pageIndex: index, choiceAction: 2)
    }
}
