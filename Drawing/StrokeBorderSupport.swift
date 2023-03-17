//
//  StrokeBorderSupport.swift
//  Drawing
//
//  Created by Justin Hold on 3/17/23.
//

import SwiftUI

struct InsettableArc: InsettableShape {
	let startAngle: Angle
	let endAngle: Angle
	let clockwise: Bool
	var insetAmount = 0.0
	func path(in rect: CGRect) -> Path {
		let rotationAdjustment = Angle.degrees(90)
		let modifiedStart = startAngle - rotationAdjustment
		let modifiedEnd = endAngle - rotationAdjustment
		var path = Path()
		
		path.addArc(
			center: CGPoint(x: rect.midX, y: rect.midY),
			radius: rect.width / 2 - insetAmount,
			startAngle: modifiedStart,
			endAngle: modifiedEnd,
			clockwise: !clockwise
		)
		return path
	}
	func inset(by amount: CGFloat) -> some InsettableShape {
		var arc = self
		arc.insetAmount += amount
		return arc
	}
}

struct StrokeBorderSupport: View {
    var body: some View {
		ZStack {
			Circle()
				.strokeBorder(.blue, lineWidth: 40)
			InsettableArc(
				startAngle: .degrees(-90),
				endAngle: .degrees(90),
				clockwise: true
			)
			.strokeBorder(.black, lineWidth: 40)
		}
    }
}

struct StrokeBorderSupport_Previews: PreviewProvider {
    static var previews: some View {
        StrokeBorderSupport()
    }
}
