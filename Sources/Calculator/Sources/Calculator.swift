import CoreGraphics // 6:42 PM Fri 1 Mar 2024

public struct Calculator {
	public let radius: CGFloat // 6:42 PM Fri 1 Mar 2024
	public let step: CGFloat = .pi / 4 // 7:32 PM Fri 1 Mar 2024
	private var diameter: CGFloat { // 6:[45][0-9]* Fri 1 Mar 2024
		get {
			return 2 * radius
		}
	}

	public func points(in bounds: CGRect, for sizes: Int) -> [CGPoint] { // 7:03 PM...7:32 PM Fri 1 Mar 2024
		let center: CGPoint = .init(x: bounds.midX, y: bounds.midY) // 7:23 PM Fri 1 Mar 2024
		var initialX: CGFloat = .pi / 2
		var initialY: CGFloat = .pi / 2

		var computedPoints: [CGPoint] = []
		for index in 0..<sizes {
			computedPoints.append(
				.init(
					x: center.x + cos(initialX) * radius,
					y: center.y - sin(initialY) * radius
				)
			)
			initialX -= step
			initialY -= step
		}
		return computedPoints
	}

	public func size(from sizes: [CGSize]) -> CGSize {
		return .init(width: diameter, height: diameter)
	}
}
