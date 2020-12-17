//
//  FlatMap.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit


class FlatMapViewController : BaseViewController
{
    
    
    
    override func btnAction(_ sender: Any) {
        FaltMap()
        SwichOperator()
    }
    
    
    func FaltMap(){
        
        let sequenseA = Observable.of(1,2,3)
        let sequenseB = Observable.of(10,100)
        
        sequenseA.flatMap { value in
            
            
            return  sequenseB.map {$0 * value}
        }.subscribe(onNext:{  value in
            print(value)
            //self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext "+"\(value)"
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext "+"\(value)"
            
        })
        
        
        
        
    }
    
    func SwichOperator(){
        
        let dispseBag = DisposeBag()
    let left = PublishSubject<String>()
      let right = PublishSubject<String>()
      
      // 1
        let observable = left.amb(right).subscribe(onNext: { value in
            
        print(value)
        
        self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n switch" + "\(value)"
        
        
        
      }).disposed(by: dispseBag)
    }
    
    
    
    
    
    
    
}
