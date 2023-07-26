//
//  ViewPresenter.swift
//  magicBall
//
//  Created by Ilya Pogozhev on 26.07.2023.
//

import Foundation

protocol ViewPresenterDelegate: AnyObject {
    func displayPrediction(_ prediction: String)
}

class ViewPresenter {
    private let answers: [String] = ["Беcспорно", "Предрешено", "Точно да", "Может быть", "Кажется - да", "Пока не ясно", "Не стоит", "Точно нет", "Сомнительно", "Лучше не стоит", "Думаю не стоит", "Однозначно"]
    
    weak var delegate: ViewPresenterDelegate?
    
    func generatePrediction() {
        let randomAnswer = self.answers.randomElement()
        delegate?.displayPrediction(randomAnswer!)
    }
}
