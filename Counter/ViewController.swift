//
//  ViewController.swift
//  Counter
//
//  Created by Anastasiia on 25.06.2024.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var reduceButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var counter: Int = 0
    var currentDate: String {
            return calculateDate()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabel.text = "0"
    }
    
    func scrollToVisibleText() {
        let range = NSMakeRange(historyTextView.text.count - 1, 0)
        historyTextView.scrollRangeToVisible(range)
    }

    @IBAction func addButtonDidTap() {
        counter += 1
        counterLabel.text = "Значение счётчика: \(counter)"
        historyTextView.text.append("\n[\(currentDate)]: значение изменено на +1")
        scrollToVisibleText()
    }
    
    @IBAction func reduceButtonDidTap() {
        if counter > 0 {
            counter -= 1
            counterLabel.text = "Значение счётчика: \(counter)"
            historyTextView.text.append("\n[\(currentDate)]: значение изменено на -1")
        } else {
            historyTextView.text.append("\n[\(currentDate)]: попытка уменьшить значение счётчика ниже 0")
        }
        
        scrollToVisibleText()
    }
    
    @IBAction func resetButtonDidTap() {
        if counter != 0 {
            counter = 0
            counterLabel.text = "Значение счётчика: \(counter)"
            historyTextView.text.append("\n[\(currentDate)]: значение сброшено")
            scrollToVisibleText()
        }
    }
}

private func calculateDate() -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
    let timeString = dateFormatter.string(from: Date())
    return timeString
}
