//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kitsune on 06.07.2020.
//

import SwiftUI


final class EmojiMemoryGame: ObservableObject {
	@Published private var model = initMemoryGame()

	// MARK: - Access to the model
	var cards: [MemoryGame<String>.Card] { model.cards }

	// MARK: - Intent(s)
	func choose(card: MemoryGame<String>.Card) {
		model.choose(card: card)
	}

	// MARK: - Game init
	static func initMemoryGame() -> MemoryGame<String> {
		let emojis = ["🌊", "🍇", "🧬", "🎁", "🧻"]
		let randomCount = Int.random(in: 2...emojis.count)

		return MemoryGame<String>(numbersOfPairsOfCard: randomCount) { index in
			emojis[index]
		}
	}
}
