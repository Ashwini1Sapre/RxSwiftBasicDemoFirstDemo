//
//  MapWithIndexViewController.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import UIKit
import RxCocoa
import RxSwift

class MapWithIndexViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func btnAction(_ sender: Any)  {
        mapWithIndexOperator()
        combineLastOprator()
    }
    
    func mapWithIndexOperator()  {
        let disposeBag = DisposeBag()
        
        // 1
        Observable.of(1, 2, 3, 4, 5, 6)
            // 2
            // .mapWithIndex in deprecated now and replaced by .enumerated().map
            .enumerated().map {
                integer, index in
                index > 2 ? integer * 2 : integer
            }
            .subscribe(
                onNext: {(result) in
                    self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext "+"\(result)"
            },onCompleted : {
                self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\nmapWithIndex" + " onCompleted"
            }
            )
            .disposed(by: disposeBag)
    }
    
    func combineLastOprator()
    {
        
        let disposeBag = DisposeBag()
        
        let sequense = Observable.of(1,2,3,4)
        let sequenseB = Observable.of ("A","B","C","D","E")
        
        let combinestr =  Observable.combineLatest(sequense,sequenseB)
            {
            
            "\($0)\($1)"
        }
        combinestr.subscribe(onNext: {value in
           
            print(value)
            
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\ncombineLast" + "\(value)"
            
            
        }).disposed(by: disposeBag)
        
        
        
    }
    
    
    
    
    
}
