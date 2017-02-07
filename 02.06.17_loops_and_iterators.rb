# LOOPS & ITERATORS

=begin
Some operations in Ruby are best served with a LOOP. What is a LOOP?
A LOOP is the repetitive execution of a code for a specified amount
of repeitions, or until a certain condition is met. There are 'while'
LOOPs, 'do/while' LOOPs, and 'for' LOOPs.
=end

# SIMPLE LOOP

=begin
The easiest way to begin a loop in Ruby is using the keyword 'LOOP'.
'LOOP' takes a block, denoted by '{...}' or 'do...end'. The LOOP
will execute any code within the block, until you manually intervene
with 'CTRL + c' (or insert a 'break' statement inside the block), and
that will stop the LOOP.
=end

# Example of a LOOP

# loop do
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
  break # Breaks out of the loop
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
