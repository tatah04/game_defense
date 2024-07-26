extends "res://Scripts/Ally_Chicken.gd"

#var local_attack_speed=.5
#var local_bullet_speed=750
#var local_bullet_range=1000

var local_chicken_stats = {
	"attack_speed":.5,
	"bullet_speed": 750,
	"bullet_range": 1000,
	"explosion_scale": .25,
}

func _ready():
	parent_ready()
	if game_manager:
		game_manager.connect("game_started",start_shoot)

func _process(delta):
	if Input.is_action_just_released("Test"):
		start_shoot()	


func start_shoot():
	override_chicken_stats()
	delayAction(ACTION_SHOOT)

func override_chicken_stats():
	chicken_stats["attack_speed"]=local_chicken_stats["attack_speed"]
	chicken_stats["bullet_range"]=local_chicken_stats["bullet_range"]
	chicken_stats["bullet_speed"]=local_chicken_stats["bullet_speed"]
