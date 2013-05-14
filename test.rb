my_cards=['H','3'],['S','Q']


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

calculate_total(my_cards)