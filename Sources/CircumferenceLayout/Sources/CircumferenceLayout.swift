import CoreGraphics // 6:33 PM Fri 1 Mar 2024
import SwiftUI
import Calculator // 6:45 PM Fri 1 Mar 2024

@available(iOS 13.0.0, *)
public struct CircumferenceLayout: Layout {
	public let radius: CGFloat // 6:33 PM Fri 1 Mar 2024
	public let direction: Direction = .clockwise // 6:35 PM Fri 1 Mar 2024

	public enum Direction {
		case clockwise
		case counterclockwise
	}

	public func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		let calculator: Calculator = .init(radius: radius)
		if subviews.count == 1 {
			return .init(width: proposal.width!, height: proposal.height!)
		}
		return calculator.size(from: subviews.map{ $0.sizeThatFits(proposal) })
	}
	public func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let calculator: Calculator = .init(radius: radius)
		let points = switch (direction) {
		case .clockwise: calculator.points(in: bounds, for: subviews.count)
		case .counterclockwise: calculator.points(in: bounds, for: subviews.count) // TODO: Implement `.counterclockwise`.
		}
		for index in 0..<subviews.count {
			subviews[index].place(at: points[index], proposal: proposal)
		}
	}
}

#Preview("0 Rectangles") {
	CircumferenceLayout(radius: .zero) {}
		.background(.red)
}

#Preview("1 Rectangle") {
	CircumferenceLayout(radius: .zero) {
		Rectangle().size(.init(width: 1, height: 1))
	}
	.background(.green)
}

#Preview("2 Rectangles") {
	CircumferenceLayout(radius: 32) {
		ForEach(0..<2, id: \.self) { _ in
			Rectangle().size(.init(width: 10, height: 10))
		}
	}
	.overlay {
		GeometryReader { reader in
			VStack(alignment: .leading) {
				Text("\(UInt(reader.size.width))")
				Text("\(UInt(reader.size.height))")
			}
			.opacity(0.0)
		}
	}
	.background(.blue)
}

#Preview("4 Rectangles") {
	CircumferenceLayout(radius: 25) {
		ForEach(0..<4, id: \.self) { _ in
			Rectangle().size(.init(width: 10, height: 10))
		}
	}
	.background(.yellow)
}

#Preview("1024 Rectangles") {
	CircumferenceLayout(radius: 25) {
		ForEach(0..<1024, id: \.self) { _ in
			Rectangle().size(.init(width: 10, height: 10))
		}
	}
	.background(.yellow)
}

#Preview("Text") {
	CircumferenceLayout(radius: 120) {
		ForEach(0..<4, id: \.self) { identifier in
			Text("Text \(identifier)")
		}
	}
	.background(.yellow)
}
