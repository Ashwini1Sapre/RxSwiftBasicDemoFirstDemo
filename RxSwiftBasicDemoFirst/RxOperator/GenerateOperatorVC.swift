//
//  GenerateOperatorVC.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import UIKit
import RxSwift
import RxCocoa
class GenerateOperatorVC: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func btnAction(_ sender: Any)  {
        executeGenerateOperator()
    }
    
    func executeGenerateOperator() {
        let source = Observable.generate(
            initialState: 0,
            condition: { $0 < 10 },
            iterate: { $0 + 1 }
        )
        
        source.subscribe(
            onNext : {
                self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext " + "\($0)"
                print($0)
            },onCompleted : {
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n" + " onCompleted"
            },onDisposed : {
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n" + " onDisposed"
            }
        )
    }
}

