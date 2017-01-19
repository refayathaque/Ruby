=begin Write a program that asks the user to type in their name
and then prints out a greeting message with their name included.
=end

puts "What is your name?"

name = gets.chomp

puts "Hello #{name}!" # can also do `puts "Hello " + name + "!"`
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
