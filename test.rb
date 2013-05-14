a=[5, 2, 8, 1, 4, 3, 2] 

# a.each_with_index do |x,i|
#   # puts i if a[i].to_i < a[i+1].to_i

a.delete_if{a[1] < a[2]}

puts a

