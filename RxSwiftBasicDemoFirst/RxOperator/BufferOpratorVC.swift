//
//  BufferOpratorVC.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import Foundation
import  RxSwift
import RxCocoa
import UIKit


class BufferOpratorVC : BaseViewController{
    
    
    
    
    override func btnAction(_ sender: Any) {
        BufferOprator()
        MargedOprator()
    }
    
    
    func BufferOprator()
    {
        let disposeBag = DisposeBag()
       
        let sequense = Observable.of(1,2,3,4,5)
        sequense.buffer(timeSpan: 10, count: 2, scheduler: MainScheduler.instance).subscribe(onNext: { value in
            
            
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\nBuffer" + "\(value)"
            print(value)
            
        }).disposed(by: disposeBag)
        
        
        
        
        
    }
    
    
    func MargedOprator()
    {
       
    let disposeBag = DisposeBag()
    
        let sequense1 = Observable.of(1,2,3,4,5)
        let sequense2 = Observable.of(6,7,8,9)
        
        let merge = Observable.merge(sequense1,sequense2)
    
        merge.subscribe(onNext: {
          print($0)
            
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n Merge" + "\($0)"
            
        })
    
    
    }
    
    
    
    
    
}
