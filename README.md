Readability-Swift
=======================

**Determine readability and comprehension difficulty for contemporary English text.**

* [iOS](https://en.wikipedia.org/wiki/IOS) reference platform, 10.3 minimum version.
* Example app and tests included.

## Metrics Included

* [Automated Readability Index](http://en.wikipedia.org/wiki/Automated_Readability_Index)
* [Coleman–Liau Index](http://en.wikipedia.org/wiki/Coleman–Liau_index)
* [Flesch-Kincaid Grade Level](http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests)
* [Flesch Reading Ease](http://en.wikipedia.org/wiki/Flesch–Kincaid_readability_tests)
* [Gunning Fog Index](http://en.wikipedia.org/wiki/Gunning_fog_index)
* [SMOG Grade](http://en.wikipedia.org/wiki/SMOG)

## Installation

[CocoaPods](http://cocoapods.org) is the easiest way to use this project. Add the following to your project Podfile:

```Ruby
use_modular_headers!

pod 'Readability-Swift', :git => 'https://github.com/brackendev/Readability-Swift.git'
```

It is a good idea to specifiy the commit. For example:

```Ruby
pod 'Readability-Swift', :git => 'https://github.com/brackendev/Readability-Swift.git', commit => '31c183bcda89b205072bcee3d3bcd5f5ee1bd707'
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

* [Objective-C](https://github.com/brackendev/Readability-Objective-C)
* [Pharo](https://github.com/brackendev/Readability-Pharo)
* [Swift](https://github.com/brackendev/Readability-Swift)
* [VisualWorks](https://github.com/brackendev/Readability-VisualWorks)

## Author

Bracken Spencer

* [GitHub](https://www.github.com/brackendev)
* [LinkedIn](https://www.linkedin.com/in/brackenspencer/)
* [Twitter](https://twitter.com/brackendev)

## License

Readability-Swift is released under the MIT license. See the LICENSE file for more info.
