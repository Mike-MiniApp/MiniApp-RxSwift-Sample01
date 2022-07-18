//
//  ViewModel.swift
//  MiniApp - RxSwift - textField
//
//  Created by 近藤米功 on 2022/07/18.
//

import Foundation
import RxSwift

class ViewModel{
    private let disposeBag = DisposeBag()

    // MARK: Observable
    var textFieldOutput = PublishSubject<String>()
    var textField2Output = PublishSubject<String>()

    // MARK: Observer
    var textFieldInput: AnyObserver<String>{
        textFieldOutput.asObserver()
    }
    var textField2Input: AnyObserver<String>{
        textField2Output.asObserver()
    }
    init(){
        textFieldOutput.asObservable().subscribe { text in
            print(text)
        }
        .disposed(by: disposeBag)

        textField2Output.asObservable().subscribe { text in
            print(text)
        }
        .disposed(by: disposeBag)
    }
}
