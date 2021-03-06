*[English](README.md) • [Français](README.fr.md).*

# DigitekaSDK
![version](https://img.shields.io/badge/version-1.0.0-blue) [![swift-package-manager](https://img.shields.io/badge/package%20manager-compatible-brightgreen.svg?logo=data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiPz4KPHN2ZyB3aWR0aD0iNjJweCIgaGVpZ2h0PSI0OXB4IiB2aWV3Qm94PSIwIDAgNjIgNDkiIHZlcnNpb249IjEuMSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB4bWxuczp4bGluaz0iaHR0cDovL3d3dy53My5vcmcvMTk5OS94bGluayI+CiAgICA8IS0tIEdlbmVyYXRvcjogU2tldGNoIDYzLjEgKDkyNDUyKSAtIGh0dHBzOi8vc2tldGNoLmNvbSAtLT4KICAgIDx0aXRsZT5Hcm91cDwvdGl0bGU+CiAgICA8ZGVzYz5DcmVhdGVkIHdpdGggU2tldGNoLjwvZGVzYz4KICAgIDxnIGlkPSJQYWdlLTEiIHN0cm9rZT0ibm9uZSIgc3Ryb2tlLXdpZHRoPSIxIiBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGlkPSJHcm91cCIgZmlsbC1ydWxlPSJub256ZXJvIj4KICAgICAgICAgICAgPHBvbHlnb24gaWQ9IlBhdGgiIGZpbGw9IiNEQkI1NTEiIHBvaW50cz0iNTEuMzEwMzQ0OCAwIDEwLjY4OTY1NTIgMCAwIDEzLjUxNzI0MTQgMCA0OSA2MiA0OSA2MiAxMy41MTcyNDE0Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDI1IDMxIDI1IDM1IDI1IDM3IDI1IDM3IDE0IDI1IDE0IDI1IDI1Ij48L3BvbHlnb24+CiAgICAgICAgICAgIDxwb2x5Z29uIGlkPSJQYXRoIiBmaWxsPSIjRUZDNzVFIiBwb2ludHM9IjEwLjY4OTY1NTIgMCAwIDE0IDYyIDE0IDUxLjMxMDM0NDggMCI+PC9wb2x5Z29uPgogICAgICAgICAgICA8cG9seWdvbiBpZD0iUmVjdGFuZ2xlIiBmaWxsPSIjRjdFM0FGIiBwb2ludHM9IjI3IDAgMzUgMCAzNyAxNCAyNSAxNCI+PC9wb2x5Z29uPgogICAgICAgIDwvZz4KICAgIDwvZz4KPC9zdmc+)](https://github.com/digiteka/outstream-ios-sdk)


Digiteka allows you to integrate a single SDK into your app, and serve "outstream" video or display ads. Sample app includes DigitekaSDK.xcframework and is showing integration example.

## Run the sample app

Clone [this](https://github.com/digiteka/outstream-ios-samples) repository, open it with Xcode, and run project.

## Prerequisites

There are some prerequisites before installing the SDK.
* Use Xcode 12.0 or higher.
* Your app targets iOS 12.0 or higher.

## Install

DigitekaSDK is distributed through Swift Package Manager. 
To integrate the SDK into your Xcode project using SPM, specify package repository url :
```
https://github.com/digiteka/outstream-ios-sdk
```

## Configuration

### App Transport Security
Your `Info.plist` should contains these keys:
```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
    <true/>
    <key>NSAllowsArbitraryLoadsForMedia</key>
    <true/>
    <key>NSAllowsArbitraryLoadsInWebContent</key>
    <true/>
</dict>
```

### App Tracking Transparency & IDFA
Starting with iOS 14, your application will have to ask for consent before tracking the user.
You can find more information about this integration in [Apple's documentation](https://developer.apple.com/documentation/apptrackingtransparency)

## Integration

### Initialize the SDK
1. Import the DigitekaSDK header
```
import DigitekaSDK
```

2. Create DTKConfig
```
let dtkConfig = DTKConfig(
    baseUrl: "<Your baseUrl>",
    mdtk: "<Your mdtk>")
```

3. Initialize the SDK with DTKConfig
```
Digiteka.shared.initialize(dtkConfig)
```

### Initialize the OutstreamView
1. In your ViewController instanciate a `OutstreamView` or specify this custom class to your xib or storyboard file, and connect it with `@IBOutlet`
```
@IBOutlet weak var outstreamView: OutstreamView!
```

2. Initialize your `OutstreamView` with the `OutstreamViewConfig` and a delegate (optional):
```
let outstreamViewConfig = OutstreamViewConfig(
urlReferer: "<Your url referer>",
zone: <Your zone>,
adUnit: "<Specify adUnit (Optional)>")

outstreamView.initialize(config: outstreamViewConfig, delegate: self)
```

3. Add delegate functions (optional):
```
extension <Your ViewController class>: OutstreamViewDelegate {
    func didUpdateHeight(_ ad: OutstreamView, height: CGFloat) {
        //Called when the height of the ad has changed
    }

    func onClose(_ ad: OutstreamView) {
        //Called when the ad closed
    }
    
    func didReceiveAd(_ ad: OutstreamView) {
        //Called when you get an ad 
    }
}
```

4. If your OutstreamView is inside a scrollView, you can add this line to your UIScrollViewDelegate, to automatically play/pause the video (optional):
```
extension <Your ViewController class>: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        outstreamView.scrollViewDidScroll(scrollView)
    }
}
```

### Load an ad 
The ad is loaded with  `load()` method.
```
outstreamView.load()
```

## Changelog

See [changelog here](CHANGELOG.md). 
