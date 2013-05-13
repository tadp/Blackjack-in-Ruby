class Card
  attr_accessor :suit, :value
  def initialize(suit, value)
    @suit=suit
    @value = value
  end

  def to_s
    "#{value} of #{suit}"
  end

  #at 1 hour mark
  def suit
    case @suit
    when 'H'
      'Hearts'
    when 'D'
      'Diamonds'
    end
  end

end

class Deck
 end

class Player
end

class Hand
end

class Dealer
end

class Blackjack
end

card=Card.new('Hearts',2)

puts "The card is #{card}"