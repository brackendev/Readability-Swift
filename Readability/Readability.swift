//
//  Readability.swift
//  Readability-Swift
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

//  Automated Readability Index: automatedReadabilityIndexForString
//           Coleman–Liau Index: colemanLiauIndexForString
//   Flesch-Kincaid Grade Level: fleschKincaidGradeLevelForString
//          Flesch Reading Ease: fleschReadingEaseForString
//            Gunning Fog Index: gunningFogScoreForString
//                   SMOG Grade: smogGradeForString

import Foundation

class Readability {
    // MARK: - Automated Readability Index
    // http://en.wikipedia.org/wiki/Automated_Readability_Index

    class func automatedReadabilityIndexForString(_ string: String) -> [String: Any] {
        let score = automatedReadabilityIndexScoreForString(string)
        let dict = ["Score": score,
                    "Ages": automatedReadabilityIndexAgesForScore(score),
                    "USA School Level": automatedReadabilityIndexUSASchoolLevelForScore(score)] as [String: Any]

        return dict
    }

    class func automatedReadabilityIndexScoreForString(_ string: String) -> Float {
        let totalWords = Float(string.wordCount())
        let totalSentences = Float(string.sentenceCount())
        let totalAlphanumericCharacters = Float(string.alphanumericCount())
        let score = 4.71 * (totalAlphanumericCharacters / totalWords) + 0.5 * (totalWords / totalSentences) - 21.43

        return score.round(to: 1)
    }

    class func automatedReadabilityIndexAgesForScore(_ score: Float) -> String {
        if score >= 15 {
            return "23+"
        } else if score >= 14 {
            return "18-22"
        } else if score >= 13 {
            return "17-18"
        } else if score >= 12 {
            return "16-17"
        } else if score >= 11 {
            return "15-16"
        } else if score >= 10 {
            return "14-15"
        } else if score >= 9 {
            return "13-14"
        } else if score >= 8 {
            return "12-13"
        } else if score >= 7 {
            return "11-12"
        } else if score >= 6 {
            return "10-11"
        } else if score >= 5 {
            return "9-10"
        } else if score >= 4 {
            return "8-9"
        } else if score >= 3 {
            return "7-8"
        } else if score >= 2 {
            return "6-7"
        } else {
            return "5-6"
        }
    }

    class func automatedReadabilityIndexUSASchoolLevelForScore(_ score: Float) -> String {
        if score >= 14 {
            return "College"
        } else if score >= 13 {
            return "12"
        } else if score >= 12 {
            return "11"
        } else if score >= 11 {
            return "10"
        } else if score >= 10 {
            return "9"
        } else if score >= 9 {
            return "8"
        } else if score >= 8 {
            return "7"
        } else if score >= 7 {
            return "6"
        } else if score >= 6 {
            return "5"
        } else if score >= 5 {
            return "4"
        } else if score >= 4 {
            return "3"
        } else if score >= 3 {
            return "2"
        } else if score >= 2 {
            return "1"
        } else {
            return "Kindergarten"
        }
    }

    // MARK: - Coleman-Liau Index
    // http://en.wikipedia.org/wiki/Coleman–Liau_index

    class func colemanLiauIndexForString(_ string: String) -> Float {
        let totalWords = Float(string.wordCount())
        let totalSentences = Float(string.sentenceCount())
        let totalAlphanumericCharacters = Float(string.alphanumericCount())
        let score = 5.88 * (totalAlphanumericCharacters / totalWords) - 0.296 * (totalSentences / totalWords) - 15.8

        return score.round(to: 1)
    }

    // MARK: - Flesch-Kincaid Grade Level
    // http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests

    class func fleschKincaidGradeLevelForString(_ string: String) -> Float {
        let totalWords = Float(string.wordCount())
        let totalSentences = Float(string.sentenceCount())
        let alphaNumeric = string.alphanumeric()
        let totalSyllables = Float(SyllableCounter.syllableCount(forWords: alphaNumeric))
        let score = 0.39 * (totalWords / totalSentences) + 11.8 * (totalSyllables / totalWords) - 15.59

        return score.round(to: 1)
    }

    // MARK: - Flesch Reading Ease
    // http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests

    class func fleschReadingEaseForString(_ string: String) -> [String: Any] {
        let score = fleschReadingEaseScoreForString(string)
        let dict = ["Score": score,
                    "USA School Level": fleschReadingEaseUSASchoolLevelForScore(score),
                    "Notes": fleschReadingEaseNotesForScore(score)] as [String: Any]

        return dict
    }

    class func fleschReadingEaseScoreForString(_ string: String) -> Float {
        let totalWords = Float(string.wordCount())
        let totalSentences = Float(string.sentenceCount())
        let alphaNumeric = string.alphanumeric()
        let totalSyllables = Float(SyllableCounter.syllableCount(forWords: alphaNumeric))
        let score = 206.835 - (1.015 * (totalWords / totalSentences)) - (84.6 * (totalSyllables / totalWords))

        return score.round(to: 1)
    }

    class func fleschReadingEaseUSASchoolLevelForScore(_ score: Float) -> String {
        if score >= 90 {
            return "5"
        } else if score >= 80 {
            return "6"
        } else if score >= 70 {
            return "7"
        } else if score >= 60 {
            return "8-9"
        } else if score >= 50 {
            return "10-12"
        } else if score >= 30 {
            return "College"
        } else {
            return "College Graduate"
        }
    }

    class func fleschReadingEaseNotesForScore(_ score: Float) -> String {
        if score >= 90 {
            return "Very easy to read. Easily understood by an average 11-year-old student."
        } else if score >= 80 {
            return "Easy to read. Conversational English for consumers."
        } else if score >= 70 {
            return "Fairly easy to read."
        } else if score >= 60 {
            return "Plain English. Easily understood by 13- to 15-year-old students."
        } else if score >= 50 {
            return "Fairly difficult to read."
        } else if score >= 30 {
            return "Difficult to read."
        } else {
            return "Very difficult to read. Best understood by university graduates."
        }
    }

    // MARK: - Gunning Fog Score
    // http://en.wikipedia.org/wiki/Gunning_fog_index

    class func gunningFogScoreForString(_ string: String) -> Float {
        let totalWords = Float(string.wordCount())
        let totalSentences = Float(string.sentenceCount())
        let totalComplexWords = Float(string.complexWordCount())
        let score = 0.4 * ((totalWords / totalSentences) + 100.0 * (totalComplexWords / totalWords))

        return score.round(to: 1)
    }

    // MARK: - SMOG Grade
    // http://en.wikipedia.org/wiki/Gunning_fog_index

    class func smogGradeForString(_ string: String) -> Float {
        let totalPolysyllables = Float(string.polysyllableWords(excludeCommonSuffixes: false))
        let totalSentences = Float(string.sentenceCount())
        let score = 1.043 * sqrtf(totalPolysyllables * (30.0 / totalSentences) + 3.1291)

        return score.round(to: 1)
    }
}
