//
//  ViewController.swift
//  magicBall
//
//  Created by Ilya Pogozhev on 15.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let viewBall1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 150
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 1
        view.snp.makeConstraints {
            $0.width.equalTo(300)
            $0.height.equalTo(300)
        }
        return view
    }()
    let viewBall2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 75
        view.snp.makeConstraints {
            $0.width.equalTo(150)
            $0.height.equalTo(150)
        }
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeContraints()
    }
}
private extension ViewController {
    func setupScene() {
        view.backgroundColor = .purple
        view.addSubview(viewBall1)
        viewBall1.addSubview(viewBall2)
    }
    func makeContraints() {
        viewBall1.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view).offset(100)
        }
        viewBall2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
        }
    }
}

