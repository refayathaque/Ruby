# LOOPS & ITERATORS

=begin
Some operations in Ruby are best served with a LOOP. What is a LOOP?
A LOOP is the repetitive execution of a code for a specified amount
of repeitions, or until a certain condition is met. There are 'while'
LOOPs, 'do/while' LOOPs, and 'for' LOOPs. *** LOOP is a method.
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

=begin
do...end or {...}?
We won't ever write code like what we have directly above using curly
braces, there are too many functions to put in a one-liner curly brace
block. For the example directly above it's best to use 'do...end'. We
should limit our use of one-liner curly brace blocks for code with just
one function. 'do...end' and '{...}' are the two styles of blocks,
BY CONVENTION, we use curly braces when everything can be contained in one
line (NOT what we have directly above). We use 'do...end' for multi-line
operations.
=end

puts "----"

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

puts "----"

# The LOOP block above can be refactored

i = 0
loop do
  i += 2
  puts i
  if i == 10
    break
  end # Because in the line above we have an 'if' statement
end

puts "----"

=begin
Notice above that we needed to have an 'end' after the line with 'break',
we needed to do this because of the 'if' statment in line 86. However if
we refactored this code like how it was originally starting from line 72
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

puts "----"

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

puts "----"

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

# *** The term 'BLOCK' can only be used to reference 'do...end' and
# '{...}'.

# *** Ruby methods ALWAYS RETURN the evaluated result of the LAST LINE
# of the expression, UNLESS an explicit return comes BEFORE it.

puts "----"

# UNTIL LOOPS

=begin
UNTIL LOOPS are simply the opposite of WHILE LOOPs. Once the boolean
becomes 'true', the UNTIL LOOP is not executed again, and the program
continues after the UNTIL LOOP. We can substitute this in to phrase
a problem in a different way, so let's do that with our WHILE LOOP
example above. Note how our given parameters evaluateing to a boolean
will change so that the UNTIL LOOP stops executing once it becomes 'true'.
=end

puts "Enter a number, then see the countdown to 0"
number = gets.chomp.to_i

until number <= -1 # Operator is simply now the OPPOSITE of what we have
  # above with the WHILE LOOP, because here we need the OPPOSITE boolean
  # value. (We use -1 here instead of 0 for math-based
  # reasons, -1 allows us to print '0' to the screen)
  puts number
  number -= 1 # Refactored from 'number = number - 1'
end

puts "Lift Off!"

=begin
So we know that WHILE and UNTIL LOOPs are simply the opposites of each
other, WHILE LOOPs stop executing once the boolean evaluates to 'false',
and UNTIL LOOPs stop executing once the boolean evaluats to 'true'.
There will be times when using UNTIL, instead of WHILE, will make our
code more readable and logical.
=end

puts "----"

# DO/WHILE LOOPS

=begin
DO/WHILE LOOPs are similar to UNTIL LOOPs (in that they also stop executing
the LOOP once the given parameter evaluating to a boolean is 'true'), with
the only difference being that the expression within the LOOP method gets
executed one time PRIOR to the conditional check determining whether the
code should be executed. In a DO/WHILE loop the conditional check is at
the end of the loop, as opposed to the beginning. A classic use case for
a DO/WHILE LOOP is when we want to ask a user if he or she wants an action
performed again, and we keep prompting if they say 'Yes'. It's a classic
use case for a DO/WHILE LOOP since we want to repeatedly perform an action
based on some condition, but we want the action to be executed at least
one time no matter what. Let's see this in action below.
=end

loop do
  puts "Should I ask you this again?"
  answer = gets.chomp
  if answer != 'yes' # Like an UNTIL LOOP, the 'break' executes once this
    # conditional is 'true'.
    break
  end
end # RETURNs nil

=begin
Note that we've used a simple LOOP method, however, the condition to
'break' out of the LOOP happens at the end, therefore ensuring that the
LOOP is executed AT LEAST ONCE. In other words, the user is asked the
question before his or her response is processed by the rest of the
expression.
=end

puts "----"

# FOR LOOPS

=begin
FOR LOOPS are for LOOPing over a collection of elements (ranges/arrays)
Unlike a WHILE LOOP, where if we're not careful we can trigger an infinite
loop, FOR LOOPs have a definite end since it's LOOPing over a FINITE
number of elements. It starts with the 'for' reserved word, followed by
a variable, then the 'in' reserved word, followed by a collection of
elements (ranges/arrays). Let's demonstrate this below.
=end

puts "Enter a number, then see 1 all the way up to the number"
number = gets.chomp.to_i

for i in 1..number do
  puts i
end

puts "Done!" # Interestingly, what was RETURNED was the collection of
# elements, in this case '1..10' (number == 10). Our earlier LOOP examples
# returned 'nil'. Something to think about...

puts "----"

# Now we'll do something similar but with an array

numberarray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for i in numberarray do
  puts i
end

puts "Done!" # Also what was RETURNED was the collection of elements, in
# this case '[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]'. What is different about
# 'FOR LOOPs' (from other LOOPs) that causes this to happen?

puts "----"

# CONDITIONALS WITHIN LOOPs

=begin
We can make LOOPs more effective and precise if we add conditional flow
control within them to alter their behavior. Let's see how this works.
=end

number = 0

while number <= 10 # LOOP stops once this conditional is 'false'.
  if number.odd? # Example of adding 'conditional flow control'. ** 'odd?'
    # is a method.
    puts number
  end
  number = number + 1
end # Outputs 1, 3, 4, 7, 9. Or, all odd numbers less than or equal to 10.

=begin
The LOOP above uses the 'odd?' method and decides if the REASSIGNED current
variable in the LOOP is odd. If it's odd it's printed to the screen. Then,
number increments by 1 (variable is REASSIGNED), and then the loop goes on to
the next iteration.
=end

puts "----"

=begin
Reserved words 'next' and 'break' can also be useful here. If we place the
'next' reserved word in a LOOP, it will jump from that line to the next LOOP
iteration without executing the code beneath it. If we place the 'break'
reserved word in a LOOP, it will exit the loop without executing the rest
of the code in the LOOP. Let's see these in action below.
=end

# Example with 'next'

number = 0

while number <= 10 # LOOP stops once this conditional is 'false'.
  if number == 3
    number += 1
    next # Jumps to next LOOP iteration without executing the code beneath.
  elsif number.odd?
    puts number
  end
  number += 1
end # Outputs 1, 4, 7, 9. Or, all odd numbers less than or equal to 10
    # EXCLUDING 3.

# We used 'next' reserved word above to avoid outputting '3' in our LOOP.

puts "----"

# Example with 'break'

number = 0

while number <= 10 # LOOP stops once this conditional is 'false'.
  if number == 7
    break # Exits the LOOP without executing the rest of the code beneath.
  elsif number.odd?
    puts number
  end
  number += 1
end # Outputs 1, 3, 5. Or, all odd numbers less than or equal to 10
    # EXCLUDING 7 and 9, because LOOP exits when value of x reaches 7.

# Entire LOOP exits when value of x reaches 7, that's why output only goes
# to 5.

# *** Rubyists, where possible, prefer to use ITERATORS over LOOPs.

puts "----"

# ITERATORS

=begin
What are ITERATORS? They're methods that naturally LOOP over a given set of
data, and allow us to operate on EACH element in a collection. Arrays in Ruby
are ordered lists. Say we have an array of names, and we want to print them,
how would we go about doing that? We can do that using the method 'each' for
arrays. The 'each' method is one type of ITERATOR. Let's try it out below.
=end

friends = ['Tom', 'Dick', 'Harry', 'Johnnie', 'Jim', 'Jack']

friends.each do |name|
  puts name
end

puts "----"

# Can also be refactored as

friends.each { |name| puts name }

=begin
So what exactly did we do above? We CALLED the 'each' method using the DOT
operator (.) on our array 'friends'. The method 'each' LOOPs through each
element in our array, IN ORDER, starting from 'Tom', it then starts to
execute the code within the block ('do...end'/'{...}'). Each time we iterate
over the array we must ASSIGN the VALUE of the ELEMENT to a VARIABLE. In our
example we named the variable 'name' and we placed it between two pipes |...|
After that, we wrote the logic that we want used to operate on the variable
(the variable represents the CURRENT ARRAY ELEMENT), and in our example above
the logic that we want used to operate on the variable is simply the method
'puts'.
=end

puts "----"

# Now let's add some functionality to our program above.

friends = ['Tom', 'Dick', 'Harry', 'Johnnie', 'Jim', 'Jack']
number = 1

friends.each do |name|
  puts "#{number}. #{name}"
  number += 1 # Number is INCREMENTED every time we go through the iteration,
  # creating a numbered list output.
end

puts "----"

# Can also be refactored as

friends.each { |name| puts "#{number}. #{name}"; number += 1 }

# *** 'each' method always RETURNs the original array

=begin
*** Key to remember that in Ruby = is for ASSIGNMENTs and == is for
COMPARISONs. IE x = [1, 2, 3] is a being ASSIGNED to the array [1, 2, 3],
and x == [1, 2, 3] is comparing the value of x to the array[1, 2, 3] to
see if they have the same values.
=end

# RECURSION

# RECURSION is another way to create a LOOP in Ruby. It is the act of calling a
# method from within itself.

# Say we wanted to know what the double of a certain number was, then the double
# of that number. Say we want to double the number until the pre-doubled number
# is 10 or greater. To do this we can try something like this.

def doubler(start)
  puts start * 2
end

doubler(2)

puts "----"

=begin
So the example above isn't a LOOP, we have to pass an argument over and over
again to find the double of the pre-doubled number. So after running the code
above we will get '4', then we have to call the method 'doubler' again and pass
in the argument '4', then we will get '8', and on and on and on. We can do what
we need done using RECURSION, it's much more simple. Let's try it.
=end

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

doubler(2) # Outputs 2, 4, 8, 16. Ends at 16 because 16 > 10.

# This version of the 'doubler' method calls 'doubler' again WITHIN the method,
# passing it the DOUBLED version of the value stored in the start variable.

puts "----"

=begin
Now we will use RECURSION to demonstrate the fibonacci sequence. What is the
fibonacci sequence? It's a sequence of numbers in which each number is the sum of
the previous two numbers in the sequence.
=end

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(6) # Outputs 8, because fibonacci(5) is 5 and fibonacci(4) is 3.

puts "----"

# An additional example of a countdown using a FOR LOOP and '.downto' method.

puts "Enter a number, then see the countdown to 0"
userinput = gets.chomp.to_i

def countdown(number)
  for i in number.downto(0) do
      next if i == number # Ensures the starting value/user input isn't printed
                          # twice
    puts i
  end
end

countdown(userinput)
puts "Lift Off!"
