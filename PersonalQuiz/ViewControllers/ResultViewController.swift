//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 29.11.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    // MARK: - Model Property
    var answersChosen: [Answer]!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        calculateResult()
        
    }
    // MARK: - IB Action Button
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Method Calculate Result
    private func calculateResult() {
        var animalFrequency = [Animal: Int]()
        
        let typesOfAnimals = answersChosen.map { $0.animal }
        
        for type in typesOfAnimals {
            animalFrequency[type] = (animalFrequency[type] ?? 0) + 1
        }
        
        let sortedAnimalFrequency = animalFrequency.sorted { $0.value > $1.value}
        
        guard let result = sortedAnimalFrequency.first?.key else { return }
        
        updateUI(with: result)
        
    }
    // MARK: - Update UI with new values
        private func updateUI(with animal: Animal) {
            resultLabel.text = "Вы - \(animal.rawValue)"
            descriptionLabel.text = animal.definition
        }
    }

   


