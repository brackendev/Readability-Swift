//
//  String.swift
//  Readability-Swift
//
//  Created by brackendev.
//  Copyright (c) 2014-2019 brackendev. All rights reserved.
//

import Foundation

extension String {
    func isPolysyllable(excludeCommonSuffixes: Bool) -> Bool {
        var polysyllable = false

        if SyllableCounter.syllableCount(forWord: self) > 2 {
            if excludeCommonSuffixes {
                if !self.lowercased().hasSuffix("es"), !self.lowercased().hasSuffix("ed"), !self.lowercased().hasSuffix("ing") {
                    polysyllable = true
                }
            } else {
                polysyllable = true
            }
        }

        return polysyllable
    }

    func polysyllableWords(excludeCommonSuffixes: Bool) -> Int {
        var count = 0

        for word in allWords() {
            if word.isPolysyllable(excludeCommonSuffixes: excludeCommonSuffixes) {
                count += 1
            }
        }

        return count
    }

    func complexWordCount() -> Int {
        var count = 0

        for word in allWords() {
            // Attempting the complex word suggestions at http://en.wikipedia.org/wiki/Gunning_fog_index
            let polysyllable = word.isPolysyllable(excludeCommonSuffixes: true)
            let properNoun = word.isCapitalized()
            let familiarJargon = false // TODO: Implement
            let compound = false // TODO: Implement

            if polysyllable && !properNoun && !familiarJargon && !compound {
                count += 1
            }
        }

        return count
    }

    func isCapitalized() -> Bool {
        let character = self.unicodeScalars.first!

        return CharacterSet.uppercaseLetters.contains(character)
    }

    func isAlphanumeric() -> Bool {
        if self.alphanumeric().count > 0 {
            return true
        }

        return false
    }

    func alphanumeric() -> String {
        let componentsSeparated = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        let componentsJoined = componentsSeparated.joined(separator: " ")

        return componentsJoined.condense()
    }

    func alphanumericCount() -> Int {
        let componentsSeparated = self.components(separatedBy: CharacterSet.alphanumerics.inverted)
        var count = 0

        for word in componentsSeparated where word.count > 0 {
            count += word.count
        }

        return count
    }

    func condense() -> String {
        let components = self.components(separatedBy: .whitespacesAndNewlines)

        return components.filter {
            !$0.isEmpty
        }.joined(separator: " ")
    }

    func sentenceCount() -> Int {
        return self.components(separatedBy: ".").count - 1
    }

    func wordCount() -> Int {
        let components = self.components(separatedBy: " ")
        var count = 0

        for word in components where word.isAlphanumeric() {
            count += 1
        }

        return count
    }

    func allWords() -> [String] {
        let range = self.startIndex..<self.endIndex
        var words: [String] = []

        self.enumerateSubstrings(in: range, options: .byWords) { substring, _, _, _ in
            words.append(substring!)
        }

        return words
    }

}

// https://stackoverflow.com/a/38215613/6582437

extension String {

    func index(at offset: Int, from start: Index? = nil) -> Index? {
        return index(start ?? startIndex, offsetBy: offset, limitedBy: endIndex)
    }

    func character(at offset: Int) -> Character? {
        precondition(offset >= 0, "offset can't be negative")

        guard let index = index(at: offset) else {
            return nil
        }

        return self[index]
    }

    subscript(_ range: CountableRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")

        let start = index(at: range.lowerBound) ?? endIndex

        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }

    subscript(_ range: CountableClosedRange<Int>) -> Substring {
        precondition(range.lowerBound >= 0, "lowerBound can't be negative")

        let start = index(at: range.lowerBound) ?? endIndex

        return self[start..<(index(at: range.count, from: start) ?? endIndex)]
    }

    subscript(_ range: PartialRangeUpTo<Int>) -> Substring {
        return prefix(range.upperBound)
    }

    subscript(_ range: PartialRangeThrough<Int>) -> Substring {
        return prefix(range.upperBound + 1)
    }

    subscript(_ range: PartialRangeFrom<Int>) -> Substring {
        return suffix(max(0, count - range.lowerBound))
    }
}

extension Substring {
    var string: String {
        return String(self)
    }
}
