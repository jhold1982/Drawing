//
//  CreativeBorders.swift
//  Drawing
//
//  Created by Justin Hold on 3/17/23.
//

import SwiftUI

struct CreativeBorders: View {
    var body: some View {
		VStack {
			Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
				.frame(width: 300, height: 300)
				.border(ImagePaint(image: Image("Example"), scale: 0.2), width: 30)
			Capsule()
				.strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 20)
				.frame(width: 300, height: 200)
		}
        
    }
}

struct CreativeBorders_Previews: PreviewProvider {
    static var previews: some View {
        CreativeBorders()
    }
}
