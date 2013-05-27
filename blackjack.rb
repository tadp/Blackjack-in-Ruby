# cards
# suits

# puts "Hit or stay?"
# player=gets.chomp
# bucket=[]
# random=[1..11].randomdown
# if
#   player="Hit"
#   	cards[random]<<Hold cards
#   end

require "pry"

def calculate_total(cards) 
#[['H','3'],['S','Q'] ... ]
  arr = cards.map{|e| e[1]}
  total=0
  arr.each do |value|
    if value == 'A'
      total +=11
    elsif value.to_i == 0 #J,Q,K
      total = total + 10
    else
      total += value.to_i
    end
  end
    #correct for Aces
    arr.select{|e| e == "A"}.count.times {total -= 10 if total > 21}
  total
end

#Interactive command line blackjack game
puts "Welcome to Blackjack!"
puts
puts "Whats your name?"
player_name=gets.chomp
puts "Hi, #{player_name}!"

deck = []
suits = ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

## Same as product
# suits.each do |suit|
#   cards.each do |card|
#     deck << [suit,card]
#   end
# end

deck = suits.product(cards)
deck.shuffle!

#Deal Cards
mycards= []
dealercards = []

mycards<<deck.pop
dealercards<<deck.pop
mycards<<deck.pop
dealercards<<deck.pop
dealer_total=calculate_total(dealercards)
mytotal=calculate_total(mycards)
if mytotal == 21
  puts "You hit Blackjack! You win!"
  exit
elsif dealer_total == 21
  puts "Dealer has Blackjack! You lose!"
  exit
end


while true
  puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealer_total}"
  puts "You have #{mycards}, for a total of #{mytotal}"
  puts
  puts "What would you like to do?  'Hit' or 'Stay'"
  hit_or_stay=gets.chomp
  if hit_or_stay.downcase == "hit"
    mytotal=calculate_total(mycards)
    puts "You have #{mycards}, for a total of #{mytotal}"
    puts "Now dealing.."
    mycards<<deck.pop
    mytotal=calculate_total(mycards)
    puts "You have #{mycards}, for a total of #{mytotal}"
    if mytotal>21
      puts "You Bust!"
      exit
    end
  elsif hit_or_stay.downcase == "stay"
    puts "Ok, you have chosen to stay"
    puts "Dealer currently has: #{dealercards}, for a total of #{dealer_total}"
    puts "Dealiing..."
    dealercards<<deck.pop
    dealer_total=calculate_total(dealercards)
    puts "Dealer has: #{dealercards}, for a total of #{dealer_total}"
    while dealer_total < 17
      puts "Dealer has: #{dealercards}, for a total of #{dealer_total}"
      puts "Dealing..."
      dealercards<<deck.pop
      dealer_total=calculate_total(dealercards)
    end
    if dealer_total >21
      puts "Dealer busts! You Win!"
      exit
    end
    if dealer_total > mytotal
      puts "Dealer Wins with #{dealercards}! You lose!"
      exit
    end
  else "Please pick Hit or Stay"
  end
end



#############Solution Video Way#####################
=begin

require "pry"

def calculate_total(cards) 
#[['H','3'],['S','Q'] ... ]
  arr = cards.map{|e| e[1]}
  total=0
  arr.each do |value|
    if value == 'A'
      total +=11
    elsif value.to_i == 0 #J,Q,K
      total = total + 10
    else
      total += value.to_i
    end
  end
    #correct for Aces
    arr.select{|e| e == "A"}.count.times {total -= 10 if total > 21}
  total
end

#Interactive command line blackjack game
puts "Welcome to Blackjack!"
puts
puts "Whats your name?"
player_name=gets.chomp
puts "Hi, #{player_name}!"

deck = []
suits = ['H','D','S','C']
cards = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']


deck = suits.product(cards)
deck.shuffle!

#Deal Cards
mycards= []
dealercards = []

mycards<<deck.pop
dealercards<<deck.pop
mycards<<deck.pop
dealercards<<deck.pop

dealer_total=calculate_total(dealercards)
mytotal=calculate_total(mycards)

#Show Cards
  puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealer_total}"
  puts "You have #{mycards}, for a total of #{mytotal}"
  puts

#Player turn
if mytotal == 21
  puts "Congratulations! You hit blackjack! You win!"
  exit
end

while mytotal < 21
  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp

  if !['1','2'].include?(hit_or_stay)
    puts "Error: you must enter 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You chose to stay."
    break
  end

  #hit
  new_card=deck.pop
  puts "Dealing card to player: #{new_card}"
  mycards << new_card
  mytotal = calculate_total(mycards)
  puts "Your total is now: #{mytotal}"

  if mytotal ==  21
    puts "Congratulations, you hit blackjack! You win!"
    exit
  elsif mytotal > 21
    puts "Sorry, it looks like you busted"
  end
end

# Dealer turn

if dealer_total==21
  puts "Sorry, dealer hit blackjack. You lose"
  exit
end

while dealer_total < 17
  #hit
  new_card = deck.pop
  puts "Dealing new card for dealer: #{new_card}"
  dealercards << new_card
  dealer_total=calculate_total(dealercards)
  puts "Dealer total is now: #{dealer_total}"

  # if dealer_total == 21
  #   puts "Sorry, dealer hit blackjack. You lose"
  #   exit
  # elsif dealer_total > 21
  #   puts "Congratulations, dealer busted! You win!"
  #   exit
  # end
end

# Compare hands

puts "Dealer's cards: "
dealercards.each do |card|
  puts "=> " + card.to_s
end

puts "Your cards:"
mycards.each do |card|
  puts "=> #{card}"
end
puts

if dealer_total > mytotal
  puts "Sorry, dealer won."
elsif dealertotal < mytotal
  puts "Congratulations, you win!"
else
  puts "It's a tie!"
end

exit
=end




