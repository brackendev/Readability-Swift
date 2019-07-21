Readability-Swift
=======================
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/995af7b26a964a75a68188b61b8a830f)](https://www.codacy.com/app/brackendev/Readability-Swift?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=brackendev/Readability-Swift&amp;utm_campaign=Badge_Grade)[![Build Status](https://travis-ci.com/brackendev/Readability-Swift.svg?branch=master)](https://travis-ci.com/brackendev/Readability-Swift)
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2Fbrackendev%2FReadability-Swift.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2Fbrackendev%2FReadability-Swift?ref=badge_shield)

**Metrics to determine readability and comprehension difficulty for contemporary English text.**

* [iOS](https://en.wikipedia.org/wiki/IOS) reference platform, 9.3 minimum version.
* Example app and tests included.

## Metrics Included

* [Automated Readability Index](http://en.wikipedia.org/wiki/Automated_Readability_Index)
* [Coleman–Liau Index](http://en.wikipedia.org/wiki/Coleman–Liau_index)
* [Flesch-Kincaid Grade Level](http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests)
* [Flesch Reading Ease](http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests)
* [Gunning Fog Index](http://en.wikipedia.org/wiki/Gunning_fog_index)
* [SMOG Grade](http://en.wikipedia.org/wiki/SMOG)

## Installation

CocoaPods is the easiest way to use this project. Add the following to your project Podfile:

```Ruby
pod 'Readability-Swift', :git => 'https://github.com/brackendev/Readability-Swift.git'
```

It is a good idea to specifiy the version or commit. For example:

```Ruby
pod 'Readability-Swift', :git => 'https://github.com/brackendev/Readability-Swift.git', commit => '2a1657ec220486499e44de2563e9c896cd969558'
```

## Example Usage

1. Import it:

    ```Swift
    import Readability_Swift
    ```

2. Use it:
    
    ```Swift
    Readability.automatedReadabilityIndexForString("Test")
    Readability.colemanLiauIndexForString("Test")
    Readability.fleschKincaidGradeLevelForString("Test")
    Readability.fleschReadingEaseForString("Test")
    Readability.gunningFogScoreForString("Test")
    Readability.smogGradeForString("Test")
    ```
    
Note: See the [example view controller](https://github.com/brackendev/Readability-Swift/blob/master/Example/Readability-Swift/ViewController.swift).

## Acknowledgements

This project makes use of the following third-party libraries:

* [objC-syllable-counter](https://github.com/brackendev/objC-syllable-counter.git)
* [RegexKitLite](http://regexkit.sourceforge.net/RegexKitLite/)

## Ports

* [Objective-C](http://brackendev.github.io/Readability-Objective-C/)
* [Pharo](http://brackendev.github.io/Readability-Pharo/)
* [VisualWorks](https://brackendev.github.io/Readability-VisualWorks/)

## Author

[brackendev](https://www.github.com/brackendev)

## License

Readability-Swift is released under the MIT license. See the LICENSE file for more info.
