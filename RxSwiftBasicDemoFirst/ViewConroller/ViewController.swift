//
//  ViewController.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 16/12/20.
//

import UIKit
import RxSwift
import RxCocoa


enum MyError: Error {
    case error1
}

class ViewController: UIViewController {
    
    
    
    
    
    //Observables
    let justObservable = Observable.just("Hello RxSwift")
    let arrayObservable = Observable.from([1,2,3])
    let dictionaryObservable = Observable.from([1:"Hello",2:"Rx"])
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    
        
        
        // Create observable with the signal is String
        let observable = Observable<String>.create { (observer) -> Disposable in
            observer.onNext("First signal")
            observer.onCompleted()
          
            // This signal is sent after calling .onCompleted()
            observer.onNext("Second signal")
          return Disposables.create()
        }
        
        // Create observers
        observable.subscribe(onNext: { (element) in
          print(element)
        }).dispose()
        
        //    dispose
        let scheduler = SerialDispatchQueueScheduler(qos: .default)
        let subscription = Observable<Int>.interval(.milliseconds(300), scheduler: scheduler)
            .subscribe { event in
                print(event)
            }

        Thread.sleep(forTimeInterval: 2.0)

        subscription.dispose()
       
        
        
       //Subscribe
        let dictSubscribe = dictionaryObservable.subscribe{event in print(event)}
                
        let arraySubscription = arrayObservable.subscribe { event in
                    switch event {
                    case .next(let value):
                        print(value)
                    case .error(let error):
                        print(error)
                    case .completed:
                        print("completed")
                    }
                }
        
        
        //Oprator ---map,filter
        
        Observable<Int>.of(1,2,3,4,5,6,7).map{ value in
            return value * value
        }.subscribe(onNext:{
            print($0)
        }
            )
           
        
        Observable<Int>.of(1,2,3,4,5,6,7).filter{$0>8}.subscribe(onNext:{
                        print($0)
                })
        
        //Flatmap
       
        
        let observable3 = Observable<Int>.of(1,2)
        let observable4 = Observable<Int>.of(3,4)
        let observableofSev = Observable.of(observable3,observable4)
        observableofSev.subscribe(onNext:{
            print($0)
        })
        observableofSev.flatMap{ return $0}.subscribe(onNext:{
            print($0)
        })
        
        
       
        //BehaviorSubject
        //A BehaviorSubject stores the most recent next() event, which is able to be replayed to new subscribers.
        let subject = BehaviorSubject(value: [10,20])
        subject.onNext([1])
        subject.asObserver().subscribe(onNext: { value in
            print(value)
            
        })
        
       //PublishSubject
    //    A PublishSubject is concerned only with emitting new events to its subscribers. It does not replay next() events, so any that existed before the subscription will not be received by that subscriber.
        
        let disposeBag = DisposeBag()
                    
        let pubSubj = PublishSubject<String>()
        let pubSubj1 = PublishSubject<String>()
        pubSubj1.on(.next("(next 1"))
        pubSubj1.subscribe({
            
            print("line: \(#line),","event: \($0)")
        })
        .disposed(by: disposeBag)
        pubSubj1.on(.next("(next 2"))
        pubSubj1.onError(MyError.error1)
        pubSubj1.on(.next("next 3"))
                    
       

//pubSubj cannot emit this event

        /* prints:
         line: 105, event: next((next 2)
         line: 105, event: error(error1)
        */
        
        //Variable
      //  At it’s heart, Variable is a wrapper around BehaviorSubject that allows for simpler handling. Instead of the usual sending of next() events, Variable provides dot syntax for getting and setting a single value that is both emitted as a next() event and stored for replay. The exposed .value property gets and sets the value to a privately stored property _value. Additionally, it creates a new next() event for the privately held BehaviorSubject contained in the Variable in the setter method. Variable also has a method .asObservable()which returns the privately held BehaviorSubject in order to manage its subscribers.
        
        
        
     //   let disposeBag = DisposeBag()
                    
        let variable = Variable<String>("starting value") //instantiate variable with starting value
                    
        variable.asObservable().subscribe({ //asObservable() returns the BehaviorSubject which is held as a property. Sequence replays "starting value" to Sub A
          print("Sub A, line: \(#line)", "event: \($0)")
        })
        .disposed(by: disposeBag)
                    
        variable.value = "next 1" // gets and sets to a privately stored property. Additionally, creates a next() event on the privately stored BehaviorSubject

        variable.asObservable().subscribe({ //Sequence replays "next 1" to Sub B
          print("Sub B, line: \(#line)", "event: \($0)")
        })
        .disposed(by: disposeBag)

        variable.value = "next 2" //emits "next 2" to both Sub A and Sub B
        
        /* prints:
         Sub A, line: 134 event: next(starting value)
         Sub A, line: 134 event: next(next 1)
         Sub B, line: 141 event: next(next 1)
         Sub A, line: 134 event: next(next 2)
         Sub B, line: 141 event: next(next 2)
         Sub A, line: 134 event: completed
         Sub B, line: 141 event: completed
        */
        
        //ReplaySubject
   //     So far we have seen a subject with no replay (PublishSubject) and two subjects that replay a single next event (BehaviorSubject and Variable). As its name suggests, the ReplaySubject provides you the ability to replay many next events.
        
      //  let disposeBag = DisposeBag()
                    
        let replaySub = ReplaySubject<String>.create(bufferSize: 4)
                    
        replaySub.on(.next("(pre) Event 1"))
        replaySub.on(.next("(pre) Event 2"))
        replaySub.on(.next("(pre) Event 3"))
        replaySub.on(.next("(pre) Event 4"))
        replaySub.on(.next("(pre) Event 5")) //5 events overfills the buffer
                    
        replaySub.subscribe({ //replays the 4 events in memory (2-5)
          print("line: \(#line)", "event: \($0)")
        })
        .disposed(by: disposeBag)
                    
        replaySub.on(.next("(post) Event 6")) //emits next event to subscription
                    
        replaySub.onError(MyError.error1) //emits error event and terminates the sequence
                    
        replaySub.on(.next("(post) Event 7")) //sequence cannot emit event as it has been terminated
        
        
        
        let sequence = Observable.of(1, 2, 3, 4, 5)
        sequence.scan(1) { $0 * $1 }.subscribe(onNext: { value in
            print(value)
        }).disposed(by: disposeBag)

        
        
     //   let disposeBag = DisposeBag()

      //  let disposeBag = DisposeBag()

       
        
        
        
        
            
        }
        
        
        
    @IBAction func ButtonPressed(_ sender: Any) {
        switch ((sender as AnyObject).tag) {
        case 1:
            let v = CreateOpratorViewController()
            self.navigationController?.pushViewController(v, animated: true)
        case 2:
            let v = GenerateOperatorVC()
            self.navigationController?.pushViewController(v, animated: true)
        case 3:
            let v = MapOperatorViewController()
            self.navigationController?.pushViewController(v, animated: true)
        case 4:
            let v = MapWithIndexViewController()
            self.navigationController?.pushViewController(v, animated: true)
            
        case 5:
            let v = FlatMapViewController()
            self.navigationController?.pushViewController(v,animated: true)
            
        case 6:
            let v = ScanOpratorVC()
            self.navigationController?.pushViewController(v,animated: true)
            
        case 7:
            let v = BufferOpratorVC()
            self.navigationController?.pushViewController(v,animated: true)
            
            
        case 8:
            let v = DistinctUntilChangedOpatorVC()
            self.navigationController?.pushViewController(v,animated: true)
            
            
        case 9:
            let v = FilterOpratorVC()
            self.navigationController?.pushViewController(v,animated: true)
        default:
            print("Nothing Selected")
        }
        
       
        
        
        
        
        
    }
        
    
    
    
    
    
    
    


}

