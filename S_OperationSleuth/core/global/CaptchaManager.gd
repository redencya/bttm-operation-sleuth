extends Node

signal card_added
signal card_removed
signal request_successful
signal request_failed

var cards_size_limit : int = 4
var cards := []
var current_card

# Called whenever an attempt is made to CAPTCHALOGUE a card.
func _captchalogue(card : ItemData):
	# fails if the card would overflow the limit.
	if cards.size()+1 > cards_size_limit: return
	cards.append(card)
	print(cards)
	emit_signal("card_added")

# Called whenever an attempt is made to EJECT a card.
func _eject(card):
	# code here
	emit_signal("card_removed")

# Called whenever the player requests access to a card.
func _request_captcha_data(card):
	# code here
	emit_signal("request_successful")
	# or emit_signal("request_failed")
