// swift-tools-version: 5.9
import PackageDescription

let package: Package = .init(
	name: "CircumferenceLayout",
	products: [
		.library(
			name: "CircumferenceLayout",
			targets: [
				"CircumferenceLayout"
			]
		)
	],
	targets: [
		.target(
			name: "CircumferenceLayout",
			dependencies: [
				"Calculator"
			]
		),
		.target(
			name: "Calculator",
		),
		.testTarget(
			name: "CircumferenceLayoutTest",
			dependencies: [
				"CircumferenceLayout"
			]
		)
	]
)
