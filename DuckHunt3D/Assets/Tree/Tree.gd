extends Spatial

onready var leaves := [$leafes, $leafes2, $leafes3]
onready var texture1 := preload("res://Assets/Tree/leaf_material_1.tres")
onready var texture2 := preload("res://Assets/Tree/leaf_material_2.tres")

onready var textures := [texture1, texture2]

func _ready():
	for leaf in leaves:
		leaf.material = textures[randi() % 2]
		
