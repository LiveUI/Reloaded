![Boost: Enterprise AppStore in Swift](https://github.com/LiveUI/Reloaded/raw/master/Other/logo.jpeg)

# CoreData - Reloaded

A brand new Swift abstraction layer for CoreData's original interface


[![Slack](https://img.shields.io/badge/join-slack-745EAF.svg?style=flat)](http://bit.ly/2B0dEyt)
[![Jenkins](https://ci.liveui.io/job/LiveUI/job/Boost/job/master/badge/icon)](https://ci.liveui.io/job/LiveUI/job/Reloaded/)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20|%20macOS|%20tvOS|%20watchOS-ff0000.svg?style=flat)](http://cocoapods.org/pods/Reloaded)
[![Swift 4](https://img.shields.io/badge/swift-4.1-orange.svg?style=flat)](http://swift.org)
[![Version](https://img.shields.io/cocoapods/v/Reloaded.svg?style=flat)](http://cocoapods.org/pods/Reloaded)
[![License](https://img.shields.io/cocoapods/l/Reloaded.svg?style=flat)](http://cocoapods.org/pods/Reloaded)


##

> <b style="color:red;">Warning! - *Project is not yet completely finished. We are going to release an alpha version in April, contact us on Slack for ETA or follow the status below*</b>

## Basic usage

```swift
import Reloaded

// Conform your NSManagedObject to Reloaded own protocol `Entity`
extension Locomotive: Entity { }

// Creating a new object
let loco = try! Locomotive.new()
loco.color = "black"
loco.hasChimney = true

// Save an object
try! loco.save()

// Fetching all black locomotives with a chimney sorted by color
let all = try! Locomotive.query.filter("color" == "red", "hasChimney" == true).sort(by: "color", direction: .orderedDescending).all()
print(all)
```
