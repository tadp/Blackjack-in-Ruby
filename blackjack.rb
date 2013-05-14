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

dealertotal=calculate_total(dealercards)
mytotal=calculate_total(mycards)



while true
puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have #{mycards}, for a total of #{mytotal}"
puts
puts "What would you like to do?  'Hit' or 'Stay'"
hit_or_stay=gets.chomp

  if hit_or_stay.to_s.downcase=="hit"
    mycards<<deck.pop
    p mycards
    mytotal=calculate_total(mycards)
  elsif hit_or_stay.downcase=="stay"
    dealercards<<deck.pop
    p dealercards
    calculate_total(dealercards)
    break
  else "Please pick Hit or Stay"
  end
end






