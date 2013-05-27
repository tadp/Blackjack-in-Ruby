# Write out the requirements of the blackjack game, and extract the major nouns. 
# Use those nouns to then think about abstracting behaviors into Classes.

#Object Oriented Blackjack game
# 1) Abstraction
# 2) Encapsulation

#What are the behaviors (methods)
#What is the state (instance variables)

class Card
  attr_accessor :suit, :face_value
  def initialize(s, fv)
    @suit = s
    @face_value = fv
  end


  #at 1 hour mark

  def find_suit
    ret_val = case suit
                when 'H' then 'Hearts'
                when 'D' then 'Diamonds'
                when 'S' then 'Spades'
                when 'C' then 'Clubs'
              end
    ret_val
  end

  def pretty_output
    puts "The #{face_value} of #{find_suit}"
  end




  @suit = ['H','D','S','C']
  @face_value = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']

end

class Deck
  # deck = []
  #   deck = @suit.product(@face_value)
  # deck.shuffle!

  attr_accessor :cards, :face_value
  def initialize
    @cards = []
    ['H','D','S','C'].each do |suit|
      ['2','3','4','5','6','7','8','9','10','J','Q','K','A'].each do |suit|
        @cards << Card.new(suit, face_value)
      end
    end
  end

  def deal_one
    deck.pop
  end

  def card
    @cards
  end


end

class Player
  attr_accessor :name, :playagain
  def initialize(name,playagain)
  end
end

class Hand
  attr_accessor :blackjack, :bust, :hit
  # if mytotal == 21
  #   puts "You hit Blackjack! You win!"
  #   exit
  # elsif dealer_total == 21
  #   puts "Dealer has Blackjack! You lose!"
  #   exit
  # end
end

class Dealer
  attr_accessor :shuffle
  # mycards<<deck.pop
  # dealercards<<deck.pop
  # mycards<<deck.pop
  # dealercards<<deck.pop
  # dealer_total=calculate_total(dealercards)
  # mytotal=calculate_total(mycards)
end

class Blackjack
  attr_accessor :game
  def initialize
    @game=game
    # @start=start
  end

#   def start
#     while true
#     puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealer_total}"
#     puts "You have #{mycards}, for a total of #{mytotal}"
#     puts
#     puts "What would you like to do?  'Hit' or 'Stay'"
#     hit_or_stay=gets.chomp
#     if hit_or_stay.downcase == "hit"
#       mytotal=calculate_total(mycards)
#       puts "You have #{mycards}, for a total of #{mytotal}"
#       puts "Now dealing.."
#       mycards<<deck.pop
#       mytotal=calculate_total(mycards)
#       puts "You have #{mycards}, for a total of #{mytotal}"
#       if mytotal>21
#         puts "You Bust!"
#         exit
#       end
#     elsif hit_or_stay.downcase == "stay"
#       puts "Ok, you have chosen to stay"
#       puts "Dealer currently has: #{dealercards}, for a total of #{dealer_total}"
#       puts "Dealiing..."
#       dealercards<<deck.pop
#       dealer_total=calculate_total(dealercards)
#       puts "Dealer has: #{dealercards}, for a total of #{dealer_total}"
#       while dealer_total < 17
#         puts "Dealer has: #{dealercards}, for a total of #{dealer_total}"
#         puts "Dealing..."
#         dealercards<<deck.pop
#         dealer_total=calculate_total(dealercards)
#       end
#       if dealer_total >21
#         puts "Dealer busts! You Win!"
#         exit
#       end
#       if dealer_total > mytotal
#         puts "Dealer Wins with #{dealercards}! You lose!"
#         exit
#       end
#     else "Please pick Hit or Stay"
#     end
#   end
# end

end

game=Blackjack.new


c1 = Card.new('H','3')
c2 = Card.new('D', '4')

c1.pretty_output
c2.pretty_output

deck = Deck.new
puts deck.card



  # def calculate_total(cards) 
  # #[['H','3'],['S','Q'] ... ]
  #   arr = cards.map{|e| e[1]}
  #   total=0
  #   arr.each do |value|
  #     if value == 'A'
  #       total +=11
  #     elsif value.to_i == 0 #J,Q,K
  #       total = total + 10
  #     else
  #       total += value.to_i
  #     end
  #   end
  #     #correct for Aces
  #     arr.select{|e| e == "A"}.count.times {total -= 10 if total > 21}
  #   total
  # end