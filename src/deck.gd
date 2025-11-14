class_name Deck

var cards: Array[int] = []

func generate() -> void:
	cards.clear()
	# Example: 1–52
	for i in range(1, 53):
		cards.append(i)

func shuffle() -> void:
	cards.shuffle()
