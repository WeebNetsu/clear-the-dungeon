extends Node2D

const COLUMNS := 4
const FACE_DOWN_PER_COL := 3

var deck := Deck.new()
var card_loader := CardLoader.new()
var columns: Array = []

func create_card(face_up: bool) -> Card:
	var card_scene = load("res://scenes/card.tscn")
	var card: Card = card_scene.instantiate()

	# Pick any front texture for now:
	var first_front = card_loader.card_fronts.values()[0]

	card.front_texture = first_front
	card.back_texture = card_loader.card_back
	card.set_face_up(face_up)

	return card

func create_columns():
	var start_x = 100
	var col_spacing = 200
	var card_spacing = 30
	var base_y = 100

	for col_index in COLUMNS:
		var column_cards = []
		var x = start_x + (col_index * col_spacing)

		# 3 face-down + 1 face-up
		for i in range(FACE_DOWN_PER_COL):
			var card = create_card(false)
			card.position = Vector2(x, base_y + i * card_spacing)
			add_child(card)
			column_cards.append(card)

		var faceup_card = create_card(true)
		faceup_card.position = Vector2(x, base_y + FACE_DOWN_PER_COL * card_spacing)
		add_child(faceup_card)
		column_cards.append(faceup_card)

		columns.append(column_cards)

func create_player_row():
	var base_x = 100
	var base_y = 400
	var spacing = 150

	# 3 face-up cards
	for i in range(3):
		var card = create_card(true)
		card.position = Vector2(base_x + i * spacing, base_y)
		add_child(card)

	# Deck (face-down)
	var deck_card = create_card(false)
	deck_card.position = Vector2(base_x + 3 * spacing, base_y)
	add_child(deck_card)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Game Started!")

	card_loader.load_assets()
	create_columns()
	create_player_row()

	deck.generate()
	deck.shuffle()
	print(deck.cards)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
