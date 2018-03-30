![Boost: Enterprise AppStore in Swift](https://github.com/LiveUI/Boost/raw/master/Other/Images/header.jpg)

# CoreData - Reloaded

A brand new Swift abstraction layer for CoreData's original interface


[![Slack](https://img.shields.io/badge/join-slack-745EAF.svg?style=flat)](http://bit.ly/2B0dEyt)
[![Jenkins](https://ci.liveui.io/job/LiveUI/job/Boost/job/master/badge/icon)](https://ci.liveui.io/job/LiveUI/job/Reloaded/)
[![Platforms](https://img.shields.io/badge/platforms-iOS%20|%20macOS|%20tvOS|%20watchOS-ff0000.svg?style=flat)](http://cocoapods.org/pods/Reloaded)
[![Swift 4](https://img.shields.io/badge/swift-4.0-orange.svg?style=flat)](http://swift.org)
[![Version](https://img.shields.io/cocoapods/v/AwesomeEnum.svg?style=flat)](http://cocoapods.org/pods/Reloaded)
[![License](https://img.shields.io/cocoapods/l/AwesomeEnum.svg?style=flat)](http://cocoapods.org/pods/Reloaded)


##

> <b style="color:red;">Warning! - *Project is not yet completely finished. We are going to release an alpha version in April, contact us on Slack for ETA or follow the status below*</b>

## Usage

```swift
let loco = try! Locomotive.new()
loco.color = "black"
loco.hasChimney = true
try! loco.save()

let all = try! Locomotive.query.filter("color" == "black").sort(by: "color", direction: .orderedDescending).all()
print(all)
```
