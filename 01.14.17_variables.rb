=begin Variables store information to be referenced and
manipulated. They also label data with a descriptive name,
this way programs can be better understood by readers and
ourselves writing the code. We can think of variables as
containers that hold information, they are there to label
and store data in memory.
=end

# Example of variables and string concatenation

first_name = "Refayat"
middle_name = "Mosaowir"
last_name = "Haque"

# Using the variables the code below will print my full name

puts "My name is #{first_name} #{middle_name} #{last_name}"

puts "----"

# Example of variables pointing to values in memory

a = 4
puts a # -> 4
b = a
puts b # -> 4
a = 7
puts a # -> 7
puts b # -> should be 7 right?

=begin What will be expect 'b' to be? 7 right? But calling
'b' gives us 4, not 7. Why is this? The value of 'b' remains
4, even though 'a' was re-assigned 7, because variables point
to values in memory, and are not deeply linked to each other.
=end

puts "----"

=begin To get information from the user we use the 'gets'
method. When used, the program waits for the user to input
information, then for them to press the enter key. We user
'.chomp' attached to 'gets' to get rid of the newline
character (\n).
=end

# Example with 'gets' and '.chomp'

puts "Hello, what is your name?"
name = gets.chomp
puts "It's a pleasure meeting you " + name + "."

puts "----"

=begin In the example above we used string concatenation,
now we will do something similar but with string
interpolation.
=end

puts "So where do you live #{name}?"
city = gets.chomp
puts "Oh I love #{city}, I really enjoyed the food there!"

puts "----"
