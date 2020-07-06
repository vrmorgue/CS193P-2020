//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kitsune on 06.07.2020.
//

import Foundation


struct MemoryGame<CardContent> {
	var cards: [Card]
	

	init(numbersOfPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
		cards = []

		for pairIndex in 0..<numbersOfPairsOfCard {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content))
			cards.append(Card(content: content))
		}
	}
	

	func choose(card: Card) {
		print("Card chosen: \(card)")
	}
}



extension MemoryGame {
	struct Card: Identifiable {
		var id = UUID()
		var isFaceUp = true
		var isMatched = false
		var content: CardContent
	}
}
