//
//  Tests.swift
//  Readability-Swift Example
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

import UIKit
import XCTest

@testable import Readability_Swift

class Readability_ExampleTests: XCTestCase {

    //                              read-able.com   readability-score.com   Readability-Swift
    // Automated Readability Index: 9.7             9.7                     9.7
    //          Coleman–Liau Index: 15.0            15.0                    14.9
    //         Flesch Reading Ease: 24.4            30.9                    24.4
    //  Flesch–Kincaid Grade Level: 13.1            12.2                    13.1
    //           Gunning Fog Score: 14.4            11.4                    14.4
    //                  SMOG Grade: 11.6            10.1                    11.6
    let testString1 = "The Australian platypus is seemingly a hybrid of a mammal and reptilian creature."

    //                              read-able.com   readability-score.com   Readability-Swift
    // Automated Readability Index: 12.1            12.1                    12.1
    //          Coleman–Liau Index: 9.2             9.2                     9.1
    //         Flesch Reading Ease: 65.4            65.4                    64.8
    //  Flesch–Kincaid Grade Level: 10.9            10.9                    11.0
    //           Gunning Fog Score: 13.8            13.8                    12.6
    //                  SMOG Grade: 8.3             8.3                     8.3
    let testString2 = "Four score and seven years ago our fathers brought forth on this continent a new nation, conceived in liberty, and dedicated to the proposition that all men are created equal. Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battlefield of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this. But, in a larger sense, we can not dedicate, we can not consecrate, we can not hallow this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us -- that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion -- that we here highly resolve that these dead shall not have died in vain -- that this nation, under God, shall have a new birth of freedom -- and that government of the people, by the people, for the people, shall not perish from the earth."

    func testReadabilityString1() {
        XCTAssert(Readability.automatedReadabilityIndexScoreForString(testString1) == 9.7)
        XCTAssert(Readability.colemanLiauIndexForString(testString1) == 14.9)
        XCTAssert(Readability.fleschKincaidGradeLevelForString(testString1) == 13.1)
        XCTAssert(Readability.fleschReadingEaseScoreForString(testString1) == 24.4)
        XCTAssert(Readability.gunningFogScoreForString(testString1) == 14.4)
        XCTAssert(Readability.smogGradeForString(testString1) == 11.6)
    }

    func testReadabilityString2() {
        XCTAssert(Readability.automatedReadabilityIndexScoreForString(testString2) == 12.1)
        XCTAssert(Readability.colemanLiauIndexForString(testString2) == 9.1)
        XCTAssert(Readability.fleschKincaidGradeLevelForString(testString2) == 11.0)
        XCTAssert(Readability.fleschReadingEaseScoreForString(testString2) == 64.8)
        XCTAssert(Readability.gunningFogScoreForString(testString2) == 12.6)
        XCTAssert(Readability.smogGradeForString(testString2) == 8.3)
    }

    func testRoundFloat() {
        XCTAssert(Float(9.7069229712853051).round(to: 1) == 9.7)
        XCTAssert(Float(13.079999923706055).round(to: 2) == 13.08)
        XCTAssert(Float(24.440014648437511).round(to: 3) == 24.440)
        XCTAssert(Float(14.430769445804451).round(to: 4) == 14.4308)
        XCTAssert(Float(11.573498725891113).round(to: 5) == 11.5735)
    }

    func testWordCount() {
        XCTAssertEqual(testString1.wordCount(), 13)
        XCTAssertEqual(testString2.wordCount(), 271)
    }

    func testSentenceCount() {
        XCTAssertEqual(testString1.sentenceCount(), 1)
        XCTAssertEqual(testString2.sentenceCount(), 10)
    }

    func testCountAlphanumericCharactersInString() {
        XCTAssertEqual(testString1.alphanumericCount(), 68)
        XCTAssertEqual(testString2.alphanumericCount(), 1149)
    }

    func testAlphanumericString() {
        XCTAssertEqual(testString1.alphanumeric(), "The Australian platypus is seemingly a hybrid of a mammal and reptilian creature")
        XCTAssertEqual(testString2.alphanumeric(), "Four score and seven years ago our fathers brought forth on this continent a new nation conceived in liberty and dedicated to the proposition that all men are created equal Now we are engaged in a great civil war testing whether that nation or any nation so conceived and so dedicated can long endure We are met on a great battlefield of that war We have come to dedicate a portion of that field as a final resting place for those who here gave their lives that that nation might live It is altogether fitting and proper that we should do this But in a larger sense we can not dedicate we can not consecrate we can not hallow this ground The brave men living and dead who struggled here have consecrated it far above our poor power to add or detract The world will little note nor long remember what we say here but it can never forget what they did here It is for us the living rather to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced It is rather for us to be here dedicated to the great task remaining before us that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion that we here highly resolve that these dead shall not have died in vain that this nation under God shall have a new birth of freedom and that government of the people by the people for the people shall not perish from the earth")
    }

    func testCondense() {
        XCTAssertEqual("   Test      test        test test          ".condense(), "Test test test test")
    }

    func testIsPolysyllable() {
        XCTAssert("crowdsourcing".isPolysyllable(excludeCommonSuffixes: false) == true)
        XCTAssert("crowdsourcing".isPolysyllable(excludeCommonSuffixes: true) == false)
    }

    func testPolysyllableWords() {
        XCTAssertEqual(testString1.polysyllableWords(excludeCommonSuffixes: false), 4)
        XCTAssertEqual(testString1.polysyllableWords(excludeCommonSuffixes: true), 4)

        XCTAssertEqual(testString2.polysyllableWords(excludeCommonSuffixes: false), 20)
        XCTAssertEqual(testString2.polysyllableWords(excludeCommonSuffixes: true), 12)
    }

    func testIsCapitalized() {
        XCTAssert("Test".isCapitalized() == true)
        XCTAssert("Test ".isCapitalized() == true)
        XCTAssert("TEST".isCapitalized() == true)
        XCTAssert("A ".isCapitalized() == true)
        XCTAssert("test".isCapitalized() == false)
        XCTAssert("tEst".isCapitalized() == false)
        XCTAssert(" Test".isCapitalized() == false)
    }

    func testComplexWordCount() {
        XCTAssertEqual(testString1.complexWordCount(), 3)
        XCTAssertEqual(testString2.complexWordCount(), 12)
    }

    // MARK: SyllableCounter

    func testSyllableCountForWord() {
        XCTAssert(SyllableCounter.syllableCount(forWord: "The") == 1)
        XCTAssert(SyllableCounter.syllableCount(forWord: "Australian") == 4)
        XCTAssert(SyllableCounter.syllableCount(forWord: "platypus") == 3)
        XCTAssert(SyllableCounter.syllableCount(forWord: "is") == 1)
        XCTAssert(SyllableCounter.syllableCount(forWord: "seemingly") == 3)
        XCTAssert(SyllableCounter.syllableCount(forWord: "a") == 1)
        XCTAssert(SyllableCounter.syllableCount(forWord: "hybrid") == 2)
        XCTAssert(SyllableCounter.syllableCount(forWord: "of") == 1)
        XCTAssert(SyllableCounter.syllableCount(forWord: "mammal") == 2)
        XCTAssert(SyllableCounter.syllableCount(forWord: "and") == 1)
        XCTAssert(SyllableCounter.syllableCount(forWord: "reptilian") == 4)
        XCTAssert(SyllableCounter.syllableCount(forWord: "creature.") == 2)
    }

    func testSyllableCountForWords() {
        let cleaned1 = testString1.alphanumeric()
        let cleaned2 = testString2.alphanumeric()

        XCTAssert(SyllableCounter.syllableCount(forWords: cleaned1) == 26)
        XCTAssert(SyllableCounter.syllableCount(forWords: cleaned2) == 367)
    }

}
