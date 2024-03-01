# Circumference Layout

## Table of Contents
- [Description](#description)
- [Discussion](#discussion)
- [License](#license)

## Description


### Topics
swift swift-package-manager swiftui

## Discussion
The package consists of the only product:

1. CircumferenceLayout

### Preview


### Getting Started


#### Traditional
1. Open /Sources/CircumferenceLayout/Sources/CircumferenceLayout.swift
2. Press <kbd>⌘</kbd> + <kbd>A</kbd> to select all.
3. Press <kbd>⌘</kbd> + <kbd>C</kbd> to copy.
4. Press <kbd>⌘</kbd> + <kbd>V</kbd> to paste.

#### Tuist
Read the [documentation](https://docs.tuist.io/documentation/tuist/).

#### Xcode
Read the [article](https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app/).

### Example

```swift
import SwiftUI

internal struct ContentView: View {
	internal var body: some View {
		CircumferenceLayout() {
			ForEach(.zero..<8, id: \.self) { integer in
				Text("Text \(integer)")
			}
		}
	}
}
```

## License
circumference-layout is licensed under the [GPL-3.0](LICENSE) license. See the [LICENSE](LICENSE) for more information.

```bash
docker run --privileged --interactive --tty --name swift-latest swift:latest /bin/bash
```
