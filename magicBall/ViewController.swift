//
//  ViewController.swift
//  magicBall
//
//  Created by Ilya Pogozhev on 15.07.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let answers: [String] = ["Беcспорно", "Предрешено", "Точно да", "Может быть", "Кажется - да", "Пока не ясно", "Не стоит", "Точно нет", "Сомнительно", "Лучше не стоит", "Думаю не стоит", "Однозначно"]
    
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
        // SHADOW
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 20)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10.0
        return view
    }()
    let viewBall2: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 90
        view.snp.makeConstraints {
            $0.width.equalTo(180)
            $0.height.equalTo(180)
        }
        return view
    }()
    let labelBall: UILabel = {
        let label = UILabel()
        label.text = "8"
        label.font = UIFont.preferredFont(forTextStyle: .title1)
        label.font = UIFont.systemFont(ofSize: 100)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.snp.makeConstraints {
            $0.width.equalTo(135)
            $0.height.equalTo(105)
        }
        return label
    }()
    let myButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 150
        button.addTarget(self, action: #selector(mixBall), for: .touchUpInside)
        button.snp.makeConstraints {
            $0.size.equalTo(300)
        }
        return button
    }()
    let labelInfo: UILabel = {
        let label = UILabel()
        label.text = "Press the Magic 8 Ball!"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.numberOfLines = 0
        return label
    }()
    let buttonReset: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Еще раз", for: .normal)
        button.backgroundColor = .black
        button.tintColor = .white
        button.layer.cornerRadius = 15
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.addTarget(self, action: #selector(reset), for: .touchUpInside)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
        makeContraints()
//        animationBall()
    }
}
private extension ViewController {
    func setupScene() {
        let customColor = UIColor(red: 0.25, green: 0, blue: 0.50, alpha: 1.0)
        view.backgroundColor = customColor
        view.addSubview(viewBall1)
        viewBall1.addSubview(viewBall2)
        viewBall2.addSubview(labelBall)
        viewBall1.addSubview(myButton)
        view.addSubview(labelInfo)
        view.addSubview(buttonReset)
    }
    func makeContraints() {
        viewBall1.snp.makeConstraints {
            $0.centerX.equalTo(view)
            $0.centerY.equalTo(view).offset(100)
        }
        viewBall2.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-55)
        }
        labelBall.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        myButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        labelInfo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.left.right.equalToSuperview().inset(50)
        }
        buttonReset.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.top.equalTo(viewBall1.snp.bottom).inset(-50)
            $0.left.right.equalToSuperview().inset(100)
        }
    }
    func animationBall() {
        UIView.animate(withDuration: 0.7, delay: 0, options: [.autoreverse, .repeat]) {
            self.viewBall1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
    @objc func mixBall() {
        print("tap ball")
        UIView.animate(withDuration: 0.7, animations: {
            self.viewBall1.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            self.labelBall.alpha = 0.0
        }, completion: { _ in
            let randomAnswer = self.answers.randomElement()
            self.labelBall.text = randomAnswer
            self.labelBall.font = UIFont.systemFont(ofSize: 25)
            UIView.animate(withDuration: 0.7, animations: {
                self.labelBall.alpha = 1.0
            })
        })
    }
    @objc func reset() {
        UIView.animate(withDuration: 0.7, animations: {
            self.labelBall.alpha = 0.0
        }, completion: {_ in
            self.labelBall.text = "8"
            self.labelBall.font = UIFont.preferredFont(forTextStyle: .title1)
            self.labelBall.font = UIFont.systemFont(ofSize: 100)
            self.labelBall.textAlignment = .center
            UIView.animate(withDuration: 0.7, animations: {
                self.labelBall.alpha = 1.0
                self.viewBall1.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
        })
    }
}


