//
//  ScanOpratorVC.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit


class ScanOpratorVC : BaseViewController
{
    
    
    override func btnAction(_ sender: Any )
  {
    
        scanOprator()
        take()
    
    
  }
    
    func scanOprator()
    {
        let disposeBag = DisposeBag()
        
        let sequence = Observable.of(1, 2, 3, 4, 5)
        sequence.scan(1) { $0 * $1 }.subscribe(onNext: { value in
            print(value)
            
          //  self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext "+"\(value)"
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n scan "+"\(value)"
            
        }).disposed(by: disposeBag)

        
        
        
        
        
        
    }
    
    
    
    func take()
    {
        
        let disposeBag = DisposeBag()
        let sequense = Observable.of(1,2,3,4,5)
        sequense.take(1).subscribe(onNext :{ value in
            
            print(value)
            
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\ntake "+"\(value)"
            
        }).disposed(by: disposeBag)
        
        print()
        
        
        sequense.takeLast(2).subscribe(onNext:{ value in
            print(value )
            
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\ntakeLast" + "\(value)"
            
        })
        
        
    }
    
    
    
    
    
}
