extends Node2D

#class references
@onready var animation_player = $AnimationPlayer
@onready var timer = $Timer
@onready var game_manager = %GameManager
const BULLET_SCENE = preload("res://Scenes/bullet.tscn")

#animation
const ACTION_SHOOT= "SHOOT"
const ACTION_DIE= "DIE"
const ACTION_IDLE= "IDLE"
var current_action="IDLE"
var default_bullet_position=0

#Stats
var chicken_stats = {
	"attack_speed":1,
	"bullet_speed": 500,
	"bullet_range": 1000,
	"explosion_scale": .25,
}
#var attack_speed =1
#var bullet_speed =1000
#var bullet_range=1000
#var explosion_scale = .25

func parent_ready():
	if timer:
		timer.connect("timeout",start)

func start():
	delayAction(current_action)

func delayAction(action:String):
	current_action=action
	if action==ACTION_SHOOT:
		timer.start(0)
		shoot()
	elif action==ACTION_DIE:
		die()
	elif action==ACTION_IDLE:
		timer.start(0)
		idle()

#func _on_timer_timeout():
	#delayAction(current_action)
	
#Shooting
func shoot():
	var bulletInstance = BULLET_SCENE.instantiate()
	bulletInstance.bullet_range=chicken_stats["bullet_range"]
	bulletInstance.bullet_speed=chicken_stats["bullet_speed"]
	bulletInstance.position= Vector2(100,20)
	bulletInstance.explosion_scale= chicken_stats["explosion_scale"]
	add_child(bulletInstance)
	animation_player.play("SHOOT")
	timer.start(chicken_stats["attack_speed"])


func die():
	print("Die")

func idle():
	print("Idle")



