=begin
Ex. 2) Write a while loop that takes input from the user, performs an action, and
only stops when the user types "STOP". Each loop can get info from the user.
=end

a = "" # Line 11 below will ASSIGN this for line 8 with the 'while conditional'
       # to process.
while a != "STOP" # Once this becomes 'false', the LOOP will stop. What that means
                  # is once the user inputs "STOP" the LOOP will stop.
  puts "Hey how's it going?"
  a = gets.chomp # User input, ASSIGNs variable 'a' on line 6
end

puts "----"

=begin
Ex. 3) Use the `each_with_index` method to iterate through an array of your creation
that prints each index and value of the array.
=end

array = ["Harry", "Dick", "Tom", "Jeff", "Andrew", "George"]

array.each_with_index do |name, index|
  puts "#{index + 1}. #{name}"
end

puts "----"

# Ex. 4) Write a method that counts down to zero using recursion.

puts "Enter a number, then see the countdown to 0"
userinput = gets.chomp.to_i

def countdown(start)
  puts start
  if start > 0
    countdown(start - 1)
  end
end

countdown(userinput - 1) # We do 'userinput - 1' because our 'userinput' stays on
                         # screen, which leads to our starting value (userinput)
                         # appearing twice. 'userinput - 1' starts the LOOP from a
                         # value ONE LESS than the starting value, and this prevents
                         # the starting value (userinput) from appearing twice.
puts "Lift Off!"

# Random exercise in sorting an array...

words  = ["Zack", "Eli", "Peter", "Alicia"]
sorted = []

sorted.push(words.sort)

p sorted.flatten! # 'flatten!' is separate from 'flatten' (both are Array methods)
                  # 'flatten!' returns the same array (IE the calling object) but a
                  # mutated version of it.
