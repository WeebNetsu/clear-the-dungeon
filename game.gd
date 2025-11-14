extends Node2D

var deck := Deck.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Game Started!")

	deck.generate()
	deck.shuffle()
	print(deck.cards)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
