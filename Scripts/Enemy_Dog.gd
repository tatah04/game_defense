extends Node2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game_manager = %GameManager
@onready var dog = $"."

const SPEED = 30
var direction=0
var isStarted=false
var health=100
var isDead = false

const ACTION_IDLE= "IDLE"
const ACTION_WALK= "WALK"
const ACTION_ATTACK= "ATTACK"
const ACTION_DIE= "DIE"


func _ready():
	if game_manager:
		game_manager.connect("game_started",_on_game_started)
	if animated_sprite_2d:
		animated_sprite_2d.connect("animation_finished",playDie)
	
func _process(delta):
	#start
	if isDead==false:
		if isStarted==false:
			direction=0
		elif isStarted==true:
			direction=-1
		#movement
		position.x+= direction*SPEED*delta
	#animation
		if isStarted==false:
			animated_sprite_2d.play(ACTION_IDLE)
		elif direction!=0 and isStarted==true:
			animated_sprite_2d.play(ACTION_WALK)
	

func _on_game_started():
	isStarted = true

func playDie():
	queue_free()

func take_damage(damage:int):
	health=health-damage

	if health<0:
		dog.collision_layer =20
		dog.collision_mask =20
		isDead=true
		animated_sprite_2d.stop()
		animated_sprite_2d.play(ACTION_DIE)
		
