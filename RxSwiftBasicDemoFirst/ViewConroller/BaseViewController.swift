//
//  BaseViewController.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import Foundation
import UIKit
class BaseViewController : UIViewController{
    
    var mycustumview : CommonView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
         addView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func addView()  {
        mycustumview = (Bundle.main.loadNibNamed("CommonView", owner: self, options: nil)?.first as? CommonView)!
        mycustumview?.frame = self.view.frame
        mycustumview?.commonBtn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)
        self.view.addSubview(mycustumview!)
    }
    
    @objc func btnAction(_ sender : Any)  {
    
    }
    
    
    
}
