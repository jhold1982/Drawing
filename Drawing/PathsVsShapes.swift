//
//  PathsVsShapes.swift
//  Drawing
//
//  Created by Justin Hold on 3/17/23.
//

import SwiftUI

struct Triangle: Shape {
	func path(in rect: CGRect) -> Path {
		var path = Path()
		path.move(to: CGPoint(x: rect.midX, y: rect.minY))
		path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
		path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
		return path
	}
}

struct Arc: Shape {
	let startAngle: Angle
	let endAngle: Angle
	let clockwise: Bool
	func path(in rect: CGRect) -> Path {
		let rotationAdjustment = Angle.degrees(90)
		let modifiedStart = startAngle - rotationAdjustment
		let modifiedEnd = endAngle - rotationAdjustment
		var path = Path()
		
		path.addArc(
			center: CGPoint(x: rect.midX, y: rect.midY),
			radius: rect.width / 2,
			startAngle: modifiedStart,
			endAngle: modifiedEnd,
			clockwise: !clockwise
		)
		return path
	}
}

struct PathsVsShapes: View {
    var body: some View {
		ZStack {
			Triangle()
				.stroke(.red, style: StrokeStyle(
					lineWidth: 10,
					lineCap: .round,
					lineJoin: .round
				))
				.frame(width: 300, height: 300)
			Arc(
				startAngle: .degrees(0),
				endAngle: .degrees(110),
				clockwise: true
			)
			.stroke(.blue, lineWidth: 10)
			.frame(width: 300, height: 300)
		}
    }
}

struct PathsVsShapes_Previews: PreviewProvider {
    static var previews: some View {
        PathsVsShapes()
    }
}
