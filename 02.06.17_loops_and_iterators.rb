# LOOPS & ITERATORS

=begin
Some operations in Ruby are best served with a LOOP. What is a LOOP?
A LOOP is the repetitive execution of a code for a specified amount
of repeitions, or until a certain condition is met. There are 'while'
LOOPs, 'do/while' LOOPs, and 'for' LOOPs.
=end

# SIMPLE LOOP

=begin
The easiest way to begin a LOOP in Ruby is using the keyword 'LOOP'.
'LOOP' takes a block, denoted by '{...}' or 'do...end'. The LOOP
will execute any code within the block, until you manually intervene
with 'CTRL + c' (or insert a 'break' statement inside the block), and
that will stop the LOOP.
=end

# Example of a LOOP

# LOOP do
  # puts "This will continue to print repeatedly until we do CTRL + c"
# end

# The above does exactly what is mentioned, it will output the string
# repeatedly until we do 'CTRL + c'. So we will just comment it out.

# CONTROLLING LOOP EXECUTION

# Let's do another example but this time with a 'break' statement.

# The first version of the example will be with 'do...end'.

i = 0 # Local variable is assigned Fixnum 0 (All operators with '='
# are assigment operators)
loop do
  i = i + 1 # 'i' is now being REASSIGNED the value of 'i + 1', returning
  # the new REASSIGNED value of 'i'.
  puts i # Prints REASSIGNED 'i' to the console, returning 'nil'
  break # Breaks out of the LOOP
end

puts "----"

# The second version of the example will be with '{...}', note the ';',
# we must use ';'s to separate things out in a {...} block since it's
# all in one line.

i = 0
loop { i += 1; puts i; break }

# We won't ever write code like what we have above in the curly braces,
# there are too many functions to put in a one-liner curly brace block.
# For the example above it's best to use 'do...end', we should limit
# our use of one-liner curly brace blocks for code with just one function.

=begin
'break' permits us to exit out of a LOOP at any point, so any code after
a 'break' won't be executed. *** 'break' won't exit out of the program,
but will only exit the LOOP and execution of whatever is after the LOOP
will continue.
=end

# We can add conditions within a LOOP, we will demonstrate this by having
# a LOOP print all even number from 0 to 20.

i = 0
loop do
  i += 2
  puts i
  break if i == 10 # This conditional executed the 'break' on the LOOP's
  # 5th iteration
end

# The LOOP block above can be refactored

i = 0
loop do
  i += 2
  puts i
  if i == 10
    break
  end # Because in the line above we have an 'if' statement
end

=begin
Notice above that we needed to have an 'end' after the line with 'break',
we needed to do this because of the 'if' statment in line 82. However if
we refactored this code like how it was originally starting from line 68
then we wouldn't need an 'end' after the line with 'break if i == 10'.
This is important to keep in mind, you will need an 'end' if you decide
to write your code with the 'if' conditional preceding the 'break' or
* 'next'.
=end

=begin
Similar to how we used 'break' to exit a loop, we can use the keyword
'next' to skip the rest of the current iteration and begin executing the
next iteration. To demonstrate this we will use the example above, and
we will skip the '4'.
=end

i = 0
loop do
  i += 2
  next if i == 4 # This conditional executed the 'next' on the LOOP's
  # 2nd iteration, causing the code below to be skipped and going on
  # to the 3rd iteration, that is why '4' was not printed.
  puts i
  break if i == 10
end

# Refactored

i = 0
loop do
  i += 2
  if i == 4
    next # *
  end
  puts i
  if i == 10
    break # *
  end
end

# WHILE LOOPS

=begin
WHILE LOOPS are given parameters that evaluates to a boolean ('true' or
'false'). Once the boolean becomes 'false', the WHILE LOOP is not
executed again, and the program continues after the WHILE LOOP. Our
code within the WHILE LOOP can have any kind of logic we want performed.
Let's demonstrate a WHILE LOOP by writing a program which will countdown
from a number provided by the user, and will print each number to the
screen as it counts down to 0.
=end

puts "Enter a number, then see the countdown to 0"
number = gets.chomp.to_i

while number >= 0
  puts number
  number = number - 1 # Can also be refactored as 'number -= 1'
end

puts "Lift Off!"

=begin
Our program above initially evaluates the line 'number >= 0', and if the
number we entered makes it evaluate to 'true' then the program enters
the LOOP. 'puts number' is executed and then 'number = number - 1', then
the program goes back to the top with the REASSIGNED value of 'number'
and evaluates 'number >= 0' again. This process is repeated until the
value of 'number' is no longer greater than or equal to 0
('number >= 0' evaluates to 'false'). It then exits the LOOP and continues
with the rest of the program, in our case, the program goes on to print
"Lift Off!"
=end
