import SwiftUI
import CircumferenceLayout // 7:48 PM Fri 1 Mar 2024

internal struct ContentView: View {
	@State private var count: UInt = .zero // 7:48 PM Fri 1 Mar 2024
	@State private var size: CGSize = .init(width: 1, height: 1) // 8:28 PM Fri 1 Mar 2024

	@State private var radius: Double = .zero
	@State private var step: Double = .zero // 08:25 PM Fri 1 Mar 2024

	internal var body: some View {
		GeometryReader { reader in
			VStack {
				CircumferenceLayout(radius: radius) {
					ForEach(0..<count, id: \.self) { _ in
						Rectangle().size(size)
							.fill(.green)
					}
				}
				.background(.red)
				.frame(height: reader.size.width)
				Form {
					Section("Scene Settings") {
						VStack {
							Stepper(value: $count) {
								Label("There are \(count) rectangles.", systemImage: "rectangle")
							}
							Stepper(value: $size.width) {
								Label("Each rectangle has width of \(size.width).", systemImage: "arrow.left.and.right")
							}
							Stepper(value: $size.height) {
								Label("Each rectangle has height of \(size.height).", systemImage: "arrow.up.and.down")
							}
						}
					}
					Section {
						// Apple does the same. https://developer.apple.com/documentation/swiftui/slider
						Slider(value: $radius, in: .zero...reader.size.width / 2) {
							Label("Radius is \(radius)", systemImage: "circle.and.line.horizontal")
						} minimumValueLabel: {
							Text("Minimum radius: \(UInt.zero)")
						} maximumValueLabel: {
							Text("Maxiumum radius: \(UInt(reader.size.width / 2))")
						}
						Stepper(value: $step) {
							Label("Step: \(step).", systemImage: "stairs")
						}
					} header: {
						Text("Layout Settings")
					} footer: {
						VStack(alignment: .leading) {
							Label("Radius is \(radius)", systemImage: "line.diagonal")
							Label("Diameter is \(2*radius)", systemImage: "line.diagonal")
						}
					}
				}
			}
		}
	}
}
