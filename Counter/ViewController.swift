//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiia on 25.06.2024.
//

import UIKit


final class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var reduceButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var counter: Int = 0
    private var currentDate: String {
        return calculateDate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "0"
    }
    
    private func scrollToVisibleText() {
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }
    
    private func calculateDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let timeString = dateFormatter.string(from: Date())
        return timeString
    }

    @IBAction private func addButtonDidTap() {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text.append("\n[\(currentDate)]: значение изменено на +1")
        scrollToVisibleText()
    }
    
    @IBAction private func reduceButtonDidTap() {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            historyTextView.text.append("\n[\(currentDate)]: значение изменено на -1")
        } else {
            historyTextView.text.append("\n[\(currentDate)]: попытка уменьшить значение счётчика ниже 0")
        }
        
        scrollToVisibleText()
    }
    
    @IBAction private func resetButtonDidTap() {
        if counter != 0 {
            counter = 0
            counterLabel.text = "Значение счётчика: \(counter)"
            historyTextView.text.append("\n[\(currentDate)]: значение сброшено")
            scrollToVisibleText()
        }
    }
}
