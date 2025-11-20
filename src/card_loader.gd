extends Node
class_name CardLoader

var card_fronts := {} # {"hearts_5": Texture2D, ...}
var card_back: Texture2D

const CARD_PATH := "res://assets/cards/"

func load_assets():
	var dir := DirAccess.open(CARD_PATH)

	if not dir: return

	for file in dir.get_files():
		if file.ends_with(".png"):
			var texture := load(CARD_PATH + file)

			if file.contains("Back"):
				card_back = texture;
			else:
				card_fronts[file.get_basename()] = texture;
