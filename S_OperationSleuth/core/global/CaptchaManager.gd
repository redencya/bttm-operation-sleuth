extends Node

signal card_added
signal card_removed
signal request_successful
signal request_failed

var cards_size_limit : int = 4
var cards = preload("res://Objects/Sylladex.tres")
var current_card

# Called whenever an attempt is made to CAPTCHALOGUE a card.
func _captchalogue(card):
	# fails if the card would overflow the limit.
	if cards.items.size() > cards_size_limit: return
	cards.items.append(card)
	cards.emit_changed()

func _input(event: InputEvent) -> void:
	if current_card && event.is_action_pressed("interact"):
		current_card = null

# Called whenever an attempt is made to EJECT a card.
func _eject(card):
	# code here
	emit_signal("card_removed")

# Called whenever the player requests access to a card.
func _request_captcha_data(card):
	# code here
	emit_signal("request_successful")
	# or emit_signal("request_failed")


# TODO: Make a system for different Input modes.
# Make it so that the system can be opted out of when 
# The player clicks on something that's non-interactable and after an interaction.
