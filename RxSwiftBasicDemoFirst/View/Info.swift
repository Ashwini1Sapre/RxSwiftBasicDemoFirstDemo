//
//  Info.swift
//  RxSwiftBasicDemoFirst
//
//  Created by Knoxpo MacBook Pro on 17/12/20.
//

import Foundation
import RxSwift
import RxCocoa

/*
//flatmap
let sequenceA = Observable.of(1, 2, 3)
let sequenceB = Observable.of(10, 100)
sequenceA.flatMap { value in
    return sequenceB.map { $0 * value }
}.subscribe(onNext: { value in
    print(value)
}).disposed(by: disposeBag)


//scan
let sequence = Observable.of(1, 2, 3, 4, 5)
sequence.scan(1) { $0 * $1 }.subscribe(onNext: { value in
    print(value)
}).disposed(by: disposeBag)

//buffer

let sequence = Observable.of(1, 2, 3, 4, 5)
sequence.buffer(timeSpan: 10, count: 2, scheduler: MainScheduler.instance).subscribe(onNext: { value in
    print(value)
}).disposed(by: disposeBag)

//Filtering
//debounce / throttle

let sequence = Observable<Int>.timer(1, period: 0.3, scheduler: MainScheduler.instance).take(15)
        
sequence.subscribe(onNext: { value in
    print("•", terminator: " ")
}).disposed(by: disposeBag)

sequence.debounce(1, scheduler: MainScheduler.instance).subscribe(onNext: { value in
    print("debounce", terminator: " ")
}).disposed(by: disposeBag)

sequence.throttle(1, scheduler: MainScheduler.instance).subscribe(onNext: { value in
    print("throttle", terminator: " ")
}).disposed(by: disposeBag)

//distinctUntilChanged

let sequence = Observable.of(1, 2, 2, 2, 3, 3, 1, 1, 1, 4, 2, 5).distinctUntilChanged()
sequence.subscribe(onNext: { value in
    print(value)
}).disposed(by: disposeBag)

//filter
let sequence = Observable.of(1, 2, 3, 4, 5)
sequence.filter { $0 > 3 }.subscribe(onNext: { value in
    print(value)
}).disposed(by: disposeBag)

//take / takeLast

let sequence = Observable.of(1, 2, 3, 4, 5)

sequence.take(1).subscribe(onNext: { value in
    print(value, terminator: " ")
}).disposed(by: disposeBag)

print()

sequence.takeLast(2).subscribe(onNext: { value in
    print(value, terminator: " ")
}).disposed(by: disposeBag)

//Combining
//combineLatest
let sequenceA = Observable.of(1, 2, 3, 4, 5)
let sequenceB = Observable.of("A", "B", "C", "D", "E")

let combined = Observable.combineLatest(sequenceA, sequenceB) {
    "\($0)\($1)"
}

combined.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

//merge

let sequenceA = Observable.of(1, 2, 3, 4, 5)
let sequenceB = Observable.of(6, 7, 8, 9, 10)

let merged = Observable.merge(sequenceA, sequenceB)

merged.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)


//Zip
let sequenceA = Observable.of(1, 2, 3, 4, 5)
let sequenceB = Observable.of("A", "B", "C")

let zipped = Observable.zip(sequenceA, sequenceB) {
    "\($0)\($1)"
}

zipped.subscribe(onNext: {
    print($0)
}).disposed(by: disposeBag)

//
*/
