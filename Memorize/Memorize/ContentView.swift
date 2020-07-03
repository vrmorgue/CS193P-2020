//
//  ContentView.swift
//  Memorize
//
//  Created by Kitsune on 03.07.2020.
//

import SwiftUI

struct ContentView: View {
	@State private var faceUp = false

	var body: some View {
		HStack {
			ForEach(0..<4) { item in
				CardView(isFaceUp: $faceUp)
			}
			.padding()
			.foregroundColor(Color.orange)
			.font(.largeTitle)
		}
	}
}



struct CardView: View {
	@Binding var isFaceUp: Bool

	var body: some View {
		ZStack {
			switch isFaceUp {
				case true:
					RoundedRectangle(cornerRadius: 10).fill(Color.white)
					RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
					Text("🦄")
				case false:
					RoundedRectangle(cornerRadius: 10).fill()
			}
		}
	}
}





struct ContentView_Previews: PreviewProvider {
	static var previews: some View { ContentView() }
}
