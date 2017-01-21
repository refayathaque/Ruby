=begin Write a program that asks the user to type in their name
and then prints out a greeting message with their name included.
=end

puts "What is your name?"

name = gets.chomp

puts "Hello #{name}!" # Can also do `puts "Hello " + name + "!"`
# Outputs 'Hello Refayat!'

puts "----"

=begin Write a program that asks a user how old they are and then
tells them how old they will be in 10, 20, 30 and 40 years.
=end

puts "How old are you?"

age = gets.chomp.to_i
age10 = age + 10
age20 = age + 20
age30 = age + 30
age40 = age + 40

puts "In 10 years you will be #{age10}."
puts "In 20 years you will be #{age20}."
puts "In 30 years you will be #{age30}."
puts "In 40 years you will be #{age40}."
# Outputs 'In 10 years you will be 37'
# Outputs 'In 20 years you will be 47'...

# Another way to do what was done above:

puts "In 10 years you will be..."
puts age + 10
puts "In 20 years you will be..."
puts age + 20
puts "In 30 years you will be..."
puts age + 30
puts "In 40 years you will be..."
puts age + 40
# Outputs 'In 10 years you will be...
# 37'
# Outputs 'In 20 years you will be...
# 47'...

puts "----"

=begin Add another section onto the first exercise that prints
the name of the user 10 times. You must do this without explicitly
writing the puts method 10 times in a row. Hint: you can use the
`times` method to do something repeatedly.
=end

puts "What is your name?"

name = gets.chomp

10.times do # `Times` method (preceded by the # of times the block
# is to be iterated) will repeat the block a set # of times
  puts "#{name}" # Can also do `puts name`
end

# Outputs 'Refayat, Refayat...' (Total of ten times)

puts "----"

=begin Modify the first exercise again so that it first asks the
user for their first name, saves it into a variable, and then does
the same for the last name. Then outputs their full name all at once.
=end

puts "What is your first name?"

first_name = gets.chomp

puts "What is your last name?"

last_name = gets.chomp

puts "#{first_name} #{last_name}" # Can also do `puts first_name
# + " " + last_name`
# Outputs 'Refayat Haque'
