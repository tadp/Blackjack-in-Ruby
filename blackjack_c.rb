class Card < Struct.new(:num, :suit)
	def name
		"#{num} of #{suit}"
	end
	
	def value(total)
		aceValue = total <= 10 ? 11 : 1
		n = num.to_i
		(n > 0 && n) || (num == "Ace" && aceValue) || 10
	end
end

def handTotal(cards) 
	cards.inject(0) { |total, c| total + c.value(total) }
end

NUMS = [ '2', '3', '4', '5', '6', '7', '8', '9', '10', "Jack", "Queen", "King", "Ace" ]
SUITS = [ 'Hearts', 'Diamonds', 'Spades', 'Clubs' ]

def genDeck
	NUMS.map { |n| SUITS.map { |s| Card.new(n, s) }}.flatten.shuffle
end

def ask(prompt, choices)
	puts prompt
	while true
		c = gets.chomp
		return c if choices.include? c
		puts "Please answer '#{choices[0]}' or '#{choices[1]}'"
	end	
end

b = <<-eos

     .-"-.     .-"-.     .-"-.     .-"-.     .-"-.     .-"-.
"-.-"     "-.-"     "-.-"     "-.-"     "-.-"     "-.-"

eos


puts b
puts "Welcome to Blackjack!"
puts b
puts "May I get your name?"
name = gets.chomp
puts b
puts "Nice to meet you, #{name}. We will now start our game of BlackJack.\n"

while true
	deck = genDeck
	mine = deck.pop 2
	dealers = deck.pop 2
	
	# Show first pair of cards: 

	puts "You and the dealer are each dealt two cards."
	puts "The dealer has one card face down, and a(n) #{dealers[0].name} card face up." 
	puts "You have a(n) #{mine[0].name} and #{mine[1].name}, for a total value of #{handTotal(mine)}."
	
	game_over = false
	while true
		if ask("Would you like to hit or stay?",["hit", "stay"]) == "stay"
			break
		end
		c = deck.pop
		mine << c
		puts "You are now dealt a(n) #{c.name} card, and your total is #{handTotal(mine)}."
		if handTotal(mine) < 21
			next
		elsif handTotal(mine) == 21
			puts "You got BlackJack! You win!"
		elsif handTotal(mine) > 21
			puts "Since your total has exceeded 21, you bust! You lose!"
		end
		puts b
		game_over = true
		break
	end
	if not game_over	
		# Dealer only goes next if player has stayed:
		while handTotal(dealers) <= 17
			dealers << deck.pop
		end

		if handTotal(dealers) > 21
			puts "\nThe dealer has bust. You win!"
		elsif handTotal(dealers) == 21
			puts "\nThe dealer has BlackJack! You lose!"
		elsif handTotal(dealers) > handTotal(mine)
			puts "\nThe dealer has a card total of #{handTotal(dealers)} while you only have #{handTotal(mine)} so the dealer wins! You lose!"
		else
			puts "\nThe dealer has a card total of #{handTotal(dealers)} while you have #{handTotal(mine)} so you win!!"
		end
	end
	puts b

	#--------------------------------------------------------------------------------------------
	# Game is over
	#--------------------------------------------------------------------------------------------

	if ask("Thanks so much for playing, #{name}! Play again?", ["yes", "no"]) == "no"
		puts <<-eos
Ok, bye!

____*##########*
__*##############
__################
_##################_________*####*
__##################_____*##########
__##################___*#############
___#################*_###############*
____#################################*
______###############################
_______#############################
________=##########################
__________########################
___________*#####################
____________*##################
_____________*###############
_______________#############
________________##########
________________=#######*
_________________######
__________________###
___________________#
eos
		exit 
	else
		puts "\nThanks for playing again, #{name}."
	end
end





