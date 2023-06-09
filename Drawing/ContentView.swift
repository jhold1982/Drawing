//
//  ContentView.swift
//  Drawing
//
//  Created by Justin Hold on 9/13/22.
//

import SwiftUI

struct ColorCyclingCircle: View {
	var amount = 0.0
	var steps = 100
	var body: some View {
		ZStack {
			ForEach(0..<100) { value in
				Circle()
					.inset(by: Double(value))
					.strokeBorder(
						LinearGradient(
							gradient: Gradient(colors: [
								color(For: value, brightness: 1),
								color(For: value, brightness: 0.5),
							]),
							startPoint: .top,
							endPoint: .bottom
						),
						lineWidth: 2
					)
			}
		}
		.drawingGroup()
	}
	func color(For value: Int, brightness: Double) -> Color {
		var targetHue = Double(value) / Double(steps) + amount
		if targetHue > 1 {
			targetHue -= 1
		}
		return Color(
			hue: targetHue,
			saturation: 1,
			brightness: brightness
		)
	}
}

struct ContentView: View {
	@State private var colorCycle = 0.0
    var body: some View {
		VStack {
			ColorCyclingCircle(amount: colorCycle)
				.frame(width: 300, height: 300)
			Slider(value: $colorCycle)
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
