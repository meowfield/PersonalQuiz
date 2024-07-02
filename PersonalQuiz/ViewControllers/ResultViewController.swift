//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    // MARK: - Properties
    var answersChosen: [Answer]!
    
    // MARK: - IBOutlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let countAnimals = answersChosen.map {
            $0.animal.rawValue
        }.reduce(into: [:]) { counts, answers in
            counts[answers, default: 0] += 1 }
        
        let resultAnimal = countAnimals.max{ $0.value < $1.value }?.key
        resultLabel.text = "Вы - \(resultAnimal ?? "🐙")"
        
        switch resultAnimal {
        case "🐶": 
            definitionLabel.text = Animal.dog.definition
        case "🐱":
            definitionLabel.text = Animal.cat.definition
        case "🐰":
            definitionLabel.text = Animal.rabbit.definition
        case  "🐢":
            definitionLabel.text = Animal.turtle.definition
        default:
            definitionLabel.text = "Вы осьминог"
        }
        
        
        self.navigationItem.hidesBackButton = true
    }
    
    // MARK: - Actions
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    
    
}
