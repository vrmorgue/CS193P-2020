//
//  GameView.swift
//  Memorize
//
//  Created by Kitsune on 03.07.2020.
//

import SwiftUI


struct GameView: View {

	private let adaptive = [GridItem(.adaptive(minimum: 100))]

	@ObservedObject private var viewModel = EmojiMemoryGame()
	
	var body: some View {
		NavigationView {
			ScrollView {
				LazyVGrid(columns: adaptive, spacing: 20) {
					ForEach(viewModel.cards.shuffled()) { card in
						CardView(card: card).onTapGesture {
							viewModel.choose(card: card)
						}
					}
				}
			}
			.foregroundColor(Color.orange)
			.font(viewModel.cards.count < 5 ? .system(size: 60) : .title)
		}
		.padding()
	}
}







struct ContentView_Previews: PreviewProvider {
	static var previews: some View { GameView() }
}
