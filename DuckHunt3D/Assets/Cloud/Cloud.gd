extends Sprite3D

onready var cloud1 = preload("res://Assets/Cloud/cloud1.png")
onready var cloud2 = preload("res://Assets/Cloud/cloud2.png")
onready var cloud3 = preload("res://Assets/Cloud/cloud3.png")
onready var cloud4 = preload("res://Assets/Cloud/cloud4.png")

onready var clouds := [cloud1, cloud2, cloud3, cloud4]

func _ready():
	texture = clouds[randi() % 4]

func _physics_process(delta):
	global_translation.x += (randi() % 4) * delta

func _on_VisibilityNotifier_camera_exited(_camera):
	queue_free()
