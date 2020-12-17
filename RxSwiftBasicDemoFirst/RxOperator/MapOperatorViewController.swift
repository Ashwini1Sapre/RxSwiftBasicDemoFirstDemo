//
//  MapOperatorViewController.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import UIKit
import RxSwift
import RxCocoa
class MapOperatorViewController : BaseViewController {
    var numberVariable = Variable<String?>(nil)
    var isEvenObservable: Observable<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    override func btnAction(_ sender: Any)  {
        mapOperator()
    }
    func mapOperator()  {
        
        let disposeBag = DisposeBag()
        
        // 1
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        
        // 2
        Observable<NSNumber>.of(123, 4, 56)
            // 3
            .map {
                formatter.string(from: $0) ?? ""
            }
            .subscribe(onNext: { (number) in
              self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext "+"\(number)"
            })
            .disposed(by: disposeBag)
        
        
        let sequence = Observable.of(1, 2, 3, 4, 5)
        sequence.map { $0 * 10 }.subscribe(onNext: { value in
            self.mycustumview?.commonLbl.text = (self.mycustumview?.commonLbl.text ?? "") + "\n onNext "+"\(value)"
            print(value)
        }).disposed(by: disposeBag)
        
        
        
    }
    
    //    func executeMapOperator()  {
    //        let disposeBag = DisposeBag()
    //
    //        let formatter = NumberFormatter()
    //        formatter.numberStyle = .spellOut
    //        Observable<NSNumber>
    //            .of(123, 4, 56)
    //            .map {
    //                formatter.string(from: $0) ?? ""
    //            }
    //            .subscribe(
    //                onNext : {
    //                    self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n onNext " + "\($0)"
    //                    print($0)
    //            },
    //                onCompleted : {
    //                    self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n" + " onCompleted"
    //            },
    //                onDisposed : {
    //                    self.myCustomView?.commonLbl.text = (self.myCustomView?.commonLbl.text ?? "") + "\n" + " onDisposed"
    //            }
    //            )
    //            .disposed(by: disposeBag)
    //    }
}
