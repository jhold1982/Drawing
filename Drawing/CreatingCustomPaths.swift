//
//  CreatingCustomPaths.swift
//  Drawing
//
//  Created by Justin Hold on 3/16/23.
//

import SwiftUI

struct CreatingCustomPaths: View {
    var body: some View {
		Path { path in
			path.move(to: CGPoint(x: 200, y: 100))
			path.addLine(to: CGPoint(x: 100, y: 300))
			path.addLine(to: CGPoint(x: 300, y: 300))
			path.addLine(to: CGPoint(x: 200, y: 100))
		}
		.stroke(.blue, style: StrokeStyle(
			lineWidth: 10,
			lineCap: .round,
			lineJoin: .round
		))
    }
}

struct CreatingCustomPaths_Previews: PreviewProvider {
    static var previews: some View {
        CreatingCustomPaths()
    }
}
