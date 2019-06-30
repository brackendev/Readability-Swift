//
//  ViewController.swift
//  Readability-Swift Example
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var textView: UITextView!
    @IBOutlet var automatedReadabilityIndexLabel: UILabel!
    @IBOutlet var colemanLiauIndexLabel: UILabel!
    @IBOutlet var fleschReadingEaseLabel: UILabel!
    @IBOutlet var fleschKincaidGradeLevelLabel: UILabel!
    @IBOutlet var gunningFogScoreLabel: UILabel!
    @IBOutlet var smogGradeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textViewDidChange(textView!)
    }

    // MARK: - UITextViewDelegate

    func textViewDidChange(_ textView: UITextView) {
        if textView.text.isEmpty {
            activityIndicator.stopAnimating()

            automatedReadabilityIndexLabel.text = nil
            colemanLiauIndexLabel.text = nil
            fleschKincaidGradeLevelLabel.text = nil
            fleschReadingEaseLabel.text = nil
            gunningFogScoreLabel.text = nil
            smogGradeLabel.text = nil
        } else {
            activityIndicator.startAnimating()

            let testText = textView.text ?? ""

            DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).async {
                let automatedReadabilityIndex = Readability.automatedReadabilityIndexForString(testText)["Score"] as? Float ?? 0
                let colemanLiauIndex = Readability.colemanLiauIndexForString(testText)
                let fleschKincaidGradeLevel = Readability.fleschKincaidGradeLevelForString(testText)
                let fleschReadingEase = Readability.fleschReadingEaseForString(testText)["Score"] as? Float ?? 0
                let gunningFogScore = Readability.gunningFogScoreForString(testText)
                let smogGrade = Readability.smogGradeForString(testText)

                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()

                    self.automatedReadabilityIndexLabel.text = String(automatedReadabilityIndex)
                    self.colemanLiauIndexLabel.text = String(colemanLiauIndex)
                    self.fleschKincaidGradeLevelLabel.text = String(fleschKincaidGradeLevel)
                    self.fleschReadingEaseLabel.text = String(fleschReadingEase)
                    self.gunningFogScoreLabel.text = String(gunningFogScore)
                    self.smogGradeLabel.text = String(smogGrade)
                }
            }
        }
    }
}
