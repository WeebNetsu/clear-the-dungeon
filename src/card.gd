extends Node2D
class_name Card

@export var front_texture: Texture2D
@export var back_texture: Texture2D
var is_face_up := false

func set_face_up(face_up: bool) -> void:
	is_face_up = face_up
	$Sprite2D.texture = front_texture if is_face_up else back_texture
