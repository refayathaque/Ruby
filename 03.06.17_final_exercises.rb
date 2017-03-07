# 1. Use the `each` method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8
# 9, 10] and print out each value.

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.each do |element|
  puts element
end

puts "---"

# 2. Same as above, but only print out values greater than 5.

numbers.each do |element|
  if element > 5
    puts element
  end
end

# 3. Now, using the same array above, use the `select` method to extract all
# odd numbers into a new array.

# 3. Now, using the same array above, use the `select` method to extract all
# odd numbers into a new array.

# There are a few ways to do this...

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Using Integer#odd?

newarray1 = numbers.select { |element| element.odd? }
p newarray1

puts "----"

newarray2 = numbers.select do |element|
  element.odd?
end
p newarray2

puts "----"

p numbers.select { |element| element.odd? }

puts "----"

p numbers.select do |element| # Oddly, this doesn't work, even though it's
                              # exactly the same as the block above, just
                              # multi-line. We get Enumerator.
  element.odd?
end

puts "---"

# Can also be done using the Modulo operator

p numbers.select { |element| element % 2 != 0 }
# Any integer divided by 2 with NO REMAINDERs will be even, but any integer
# divided by 2 WITH REMAINDERs will be odd, hence the block above with '!='.

puts "----"

# Can also be done another way using Array#each.

odd = []

numbers.each do |element|
  if element.odd?
    odd.push(element)
  end
end

p odd

puts "----"

# 4. Append "11" to the end of the original array. Prepend "0" to the
# beginning.
