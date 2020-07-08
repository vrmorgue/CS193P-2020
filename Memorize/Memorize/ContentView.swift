//
//  GameView.swift
//  Memorize
//
//  Created by Kitsune on 03.07.2020.
//

import SwiftUI

struct GameView: View {

	private var adaptiveGrid = [GridItem(.adaptive(minimum: 100))]

	@State private var viewModel = EmojiMemoryGame()
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: adaptiveGrid, spacing: 20) {
					ForEach(viewModel.cards.shuffled()) { card in
						CardView(card: card).onTapGesture {
							viewModel.choose(card: card)
						}
					}
				}
			}
			.foregroundColor(Color.orange)
			.font(viewModel.cards.count < 5 ? Font.system(size: 60) : .title)
		}
		.padding()
	}
}



struct CardView: View {
	var card: MemoryGame<String>.Card
	
	var body: some View {
		ZStack {
			switch card.isFaceUp {
				case true:
					RoundedRectangle(cornerRadius: 10).fill(Color.white)
					RoundedRectangle(cornerRadius: 10).strokeBorder(lineWidth: 3)
					Text(card.content)
				case false:
					RoundedRectangle(cornerRadius: 10).fill()
			}
		}
	}
}








struct ContentView_Previews: PreviewProvider {
	static var previews: some View { GameView() }
}
