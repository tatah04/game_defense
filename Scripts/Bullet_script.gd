extends Area2D

var bullet_speed =1000
var bullet_range =1000
var explosion_scale=.25
var isShooting = true
@onready var explosion_sprite = $Explosion_Sprite
@onready var bullet_sprite = $Bullet_Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if isShooting:
		self.position.x+= bullet_speed*delta
	pass

func _on_area_entered(area):
	if area.has_method("take_damage"):
		area.take_damage(20)
	isShooting=false
	explosion_sprite.visible=true
	explosion_sprite.scale= Vector2(explosion_scale,explosion_scale)
	bullet_sprite.visible=false
	explosion_sprite.play("default")


func _on_explotion_sprite_animation_finished():
	queue_free()

