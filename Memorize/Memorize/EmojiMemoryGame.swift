//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Kitsune on 06.07.2020.
//

import SwiftUI


class EmojiMemoryGame {
	private var model = initMemoryGame()

	static func initMemoryGame() -> MemoryGame<String> {
		let emojis = ["🌊", "🍇", "🧬", "🎁", "🧻"]
		let randomCount = Int.random(in: 2...emojis.count)

		return MemoryGame<String>(numbersOfPairsOfCard: randomCount) { index in
			emojis[index]
		}
	}

	// MARK: - Access to the model
	var cards: [MemoryGame<String>.Card] { model.cards }

	// MARK: - Intent(s)
	func choose(card: MemoryGame<String>.Card) {
		model.choose(card: card)
	}
}
