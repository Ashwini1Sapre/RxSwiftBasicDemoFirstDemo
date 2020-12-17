//
//  FilterOpratorVC.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit



class FilterOpratorVC : BaseViewController
{
    
    override func btnAction(_ sender: Any) {
        FilterOprator()
        print("\n")
        startwithoprator()
        Skipoprator()
    }
    
    
    
    
   func FilterOprator()
    {
        
    let sequense = Observable.of(1,2,3,4,5,6)
    
    sequense.filter{ $0 > 3 }.subscribe(onNext: { value in
        
        print(value)
        
        self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n filter" + "\(value)"
        })
        
    }
    
    
    
   func startwithoprator()
    
    {
    let disposeBag = DisposeBag()
    let numbers = Observable.of(2, 3, 4)
      
      // 2
      let observable = numbers.startWith(1)
      _ = observable.subscribe(onNext: { value in
        print(value)
        self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\nStratwith" + "\(value)"
        
        
      }).disposed(by: disposeBag)
    
  
    
    
    }
    
    
    func Skipoprator()
    {
    let dispseBag = DisposeBag()
        
        let subscribe = Observable.of(1,2,3,4,5,6)
        
        subscribe.skip(3).subscribe(onNext: {
            
            print($0)
        
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n skip" + "\($0)"
   

        }).disposed(by: dispseBag)
    
    
    }
    
}
