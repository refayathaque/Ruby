=begin
String INTERPOLATION is a way to merge Ruby code
with strings. The syntax is: #{ruby expression}, and
whatever is returned will be CONCATENATED with the
surrounding string.
=end

# Example 1

name = "Refayat"
age = "twenty-seven"
city = "Washington, DC"
country_of_origin = "Bangladesh"

puts "My name is #{name} and I am #{age} years old. I live in #{city} but I am orginally from #{country_of_origin}."

puts "----"

# Example 2

result = "10"
input_one = "3"
input_two = "7"

puts "The sum of #{input_one} and #{input_two} is #{result}."

puts "----"

# An example of string CONCATENATION with '+'

puts "Air" + "port" # Prints 'Airport'

puts "----"

# An example of string CONCATENATION with integers inside strings

puts "1" + "1" # Prints '11', not '2' because '1' and '1' are both strings not integers
puts 1 + 1 # Prints '2', because 1 and 1 are integers not strings

puts "----"

# What if we want to convert a string to an integer or float(integer with decimals)?

puts "1".to_i # '.to_i' can be called to convert to an integer
puts "1.2345".to_f # '.to_i' can be called to covert to a float
puts 1.to_s # '.to_s' can be called to covert an integer/float to a string
