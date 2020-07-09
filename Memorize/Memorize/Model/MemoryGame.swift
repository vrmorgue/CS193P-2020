//
//  MemoryGame.swift
//  Memorize
//
//  Created by Kitsune on 06.07.2020.
//

import Foundation


// MARK: - Model
struct MemoryGame<CardContent> {
	var cards: [Card]


	func index(of card: Card) -> Int {
		for index in 0..<cards.count {
			guard cards[index].id != card.id else { return index }
		}

		// TODO: Scary code below from Lecture 3
		return 0
	}

	mutating func choose(card: Card) {
		#if DEBUG
		print("Card chosen: \(card)")
		#endif

		let index = self.index(of: card)
		cards[index].isFaceUp = !cards[index].isFaceUp
	}

	init(numbersOfPairsOfCard: Int, cardContentFactory: (Int) -> CardContent) {
		cards = []

		for pairIndex in 0..<numbersOfPairsOfCard {
			let content = cardContentFactory(pairIndex)
			cards.append(Card(content: content))
			cards.append(Card(content: content))
		}
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
