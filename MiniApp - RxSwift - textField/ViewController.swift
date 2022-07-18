//
//  ViewController.swift
//  MiniApp - RxSwift - textField
//
//  Created by 近藤米功 on 2022/07/18.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textField2: UITextField!

    private let disposeBag = DisposeBag()
    private let viewModel = ViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings(){
        textField.rx.text.asDriver().drive { text in
            self.viewModel.textFieldInput.onNext(text ?? "")
        }
        .disposed(by: disposeBag)

        textField2.rx.text.asDriver().drive { text in
            self.viewModel.textField2Input.onNext(text ?? "")
        }
        .disposed(by: disposeBag)

    }


}

