extends Node3D

var ADSLERP = 13
@export var default_position : Vector3
@export var ads_position : Vector3
var FOVIEW = {"NORMAL" : 90 , "ADS" : 60}

@onready var camera = $"../../../Camera3D"

# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ADS"):
		transform.origin = transform.origin.lerp(ads_position, ADSLERP * delta)
		camera.fov = lerpf(camera.fov, FOVIEW["ADS"], ADSLERP * delta)
	else:
		transform.origin = transform.origin.lerp(default_position, ADSLERP * delta)
		camera.fov = lerpf(camera.fov, FOVIEW["NORMAL"], ADSLERP * delta)
