//
//  CreateOpratorViewController.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import UIKit
import RxCocoa
import RxSwift

class CreateOpratorViewController : BaseViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.

    }
    
    override func btnAction(_ sender: Any) {
        let sourse : Observable = Observable<String>.create{ observer in
            for i in 1...10
            {
                observer.on(.next("\(i)"))
                
            }
            observer.on(.completed)
            return Disposables.create {
                self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n" + " Disposable disposed"
            }
        }
        sourse.subscribe(
            onNext: {
                self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext " + "\($0)"
                print($0)
            },onCompleted : {
                self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n" + " onCompleted"
            },onDisposed: {
                self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n" + " onDisposed"
            }
        )
            
            
            
        }
    
    
    
    
    
    
    
    
}
