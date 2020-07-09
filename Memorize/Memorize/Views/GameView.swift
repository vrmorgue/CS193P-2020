//
//  GameView.swift
//  Memorize
//
//  Created by Kitsune on 03.07.2020.
//

import SwiftUI


struct GameView: View {

	// MARK: - Some constans's
	private let columns = [
		GridItem(.adaptive(minimum: 150))
	]

	// TODO: - Create font extension
	let geometryFont: (GeometryProxy) -> CGFloat = { geo in
		max(geo.size.width, geo.size.height) * 0.15
	}

	// MARK: - Reactive model
	@ObservedObject private var viewModel = EmojiMemoryGame()
	
	var body: some View {
		ScrollView {
			GeometryReader { geo in
				LazyVGrid(columns: columns, spacing: 10) {
					ForEach(viewModel.cards) { card in
						CardView(card: card)
							.font(.system(size: geometryFont(geo)))
							.foregroundColor(.purple)
							.onTapGesture {
								viewModel.choose(card: card)
							}
					}
				}
				.padding()
			}
		}
	}
}







struct ContentView_Previews: PreviewProvider {
	static var previews: some View { GameView() }
}
