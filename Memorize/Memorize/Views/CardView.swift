//
//  CardView.swift
//  Memorize
//
//  Created by Kitsune on 08.07.2020.
//

import SwiftUI


struct CardView: View {

	// MARK: - Drawing constant
	let radius: CGFloat = 10.0
	let edgeLineWidth: CGFloat = 3


	var card: MemoryGame<String>.Card
	

	var body: some View {
		ZStack {
			switch card.isFaceUp {
				case true:
					RoundedRectangle(cornerRadius: radius).fill(Color.white)
					RoundedRectangle(cornerRadius: radius).strokeBorder(lineWidth: edgeLineWidth)
					Text(card.content).padding()
				case false:
					RoundedRectangle(cornerRadius: radius).fill()
			}
		}
	}
}
