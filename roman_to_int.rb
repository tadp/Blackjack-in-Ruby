def roman_to_int(roman)

  hash = { "I" => 1, "V" => 5, "X" => 10, "L" => 50, "C" => 100, "D" => 500, "M" => 1000 }

a = roman.split("")  # [ "C", "M", "X", "L", "I", "V"]

subtract = []  # array that holds the symbols we want to subtract the values of

a.each_with_index do |x, i|
  subtract << (a.delete_at(i) if (a[i+1].to_i > a[i].to_i))
end

sum_subtract = 0

subtract.each do |x|
  sum_subtract = hash.include?(x) ? sum_subtract += hash[x] : sum_subtract
end

sum_add = 0

a.each do |x|
  sum_add += hash[x]
end

total = sum_add - sum_subtract

end