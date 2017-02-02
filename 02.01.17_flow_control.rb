# CONDITIONALs

=begin
CONDITIONALs are like forks in the road. Our data will approach a
CONDITIONAL and the CONDITIONAL will guide the data on where to go based
on some defined parameters. CONDITIONALs are defined using IF statements
and COMPARISON operators such as <, >, <=, >=, ==, !=, &&, ||. CONDITIONALs
are logic structures defined with the reserved words IF, ELSE, ELSIF, and
END. Let's try and example.
=end

puts "Enter a number"
number = gets.chomp.to_i # the 'to_i' method is called on a string to
#convert it into an integer. *** 'gets' ALWAYS gives us a string.

if number == 3
  puts "You've entered the number 3"
elsif number == 4
  puts "You've entered the number 4"
else
  puts "You've entered neither 3, nor 4"
end

puts "----"

# If we want to write out a conditional using 1-line syntax we must use
# the keyword 'THEN', like in the example below.

puts "Enter your name"
name = gets.chomp

if name == "Refayat" then puts "You are the owner of this MacBook"
  else puts "You are NOT the owner of this MacBook" end

puts "----"

# Since Ruby is so expressive we can append the IF condition at the very
# end. We can rewrite the above example this way.

puts "Enter your name"
name = gets.chomp

puts "You are the owner of this MacBook" if name == "Refayat"
puts "You are NOT the owner of this MacBook" unless name == "Refayat"
# See below for UNLESS

puts "----"

# Ruby also has a reserved word that acts as the opposite of IF, and it's
# 'UNLESS', let's use it in an example.

puts "Enter a number"
number = gets.chomp.to_i

puts "The number is NOT 3" unless number == 3
puts "The number is 3" if number == 3

puts "----"

# COMPARISONs

=begin
COMPARISON operators always return a BOOLEAN value, a BOOLEAN value is
always either 'true' or 'false', nothing else. '<' is the "less than"
symbol meaning anything to the left has a lower value than anything to
the right, and vice versa for '>'. '<=' is the "less than or equal to"
symbol, so anything to the left is less than or equal to anything on the
right, and vice versa for '>='. '==' is "equal to", anything to the left
is equal to anything to the right. '!=' is "not equal to", anything to
the left is not equal to anything to the right.
=end

# COMBINING EXPRESSIONs

=begin
We can combine multiple CONDITIONAL EXPRESSIONs together if we want, we
can do this using the '&&' and '||' operators. '&&' is the "and" operator,
EXPRESSIONs to the left AND to the right of this operator have to be both
true for the entire expression to be evaluated as true. '||' is the "or"
operator, either the expression on the left has to be true or the expression
to the right has to be true for the entire expression to be evaluated as
true (One or the other has to be true for the whole thing to be true).
'!' is the "not" operator, and when we add this in front of a BOOLEAN
expression it changes the BOOLEAN value to its opposite. Let's see examples
of COMPARISONs and COMBINING EXPRESSIONs below.
=end

# Done in PRY

=begin
[1] pry(main)> 4 < 5
=> true
[2] pry(main)> 4 > 5
=> false
[3] pry(main)> 4 <= 5
=> true
[4] pry(main)> 5 >= 4
=> true
[5] pry(main)> 4 == 4
=> true
[6] pry(main)> 4 != 4
=> false (Because 4 IS equal to 4)
[7] pry(main)> (4 < 5) && (5 > 4)
=> true (Because BOTH sides are true)
[8] pry(main)> (4 <= 3) && (4 == 4)
=> false (Because while the right side is true, the left side is not)
[9] pry(main)> (4 <= 3) || (4 == 4)
=> true (Because only ONE side has to be true, the right side is true)
[10] pry(main)> (3 != 4) || (3 >= 1)
=> true (Because only ONE side has to be true, here both sides are true)
[11] pry(main)> !(3 > 2)
=> false (Because the OPPOSITE of 3 > 2 being true is false)
[12] pry(main)> !(2 != 2)
=> true (Because the OPPOSITE of 2 != 2 being false is true)
=end

=begin
We must keep in mind that Ruby follows an ORDER OF PRECEDENCE when
evaluating multiple expressions. At the highest level of PRECEDENCE
are the COMPARISON operators (<=, <, >, and >=), then the EQUALITY
operators (== and !=), then the logical AND (&&), and finally the
logical OR (||). Let's look at an example below.

if x && y || y
  # do something
end

Ruby will first execute 'x && y' as per the ORDER OF PRECEDENCE. If
'x && y' is true then the program will execute '# do something' by
virtue of logical OR (||). If the 'x && y' is false then the
program will look to 'z', if 'z' is true then '# do somthing' will be
executed (by virtue of ||), if 'z' is false then the code will exit
the if statement.
=end

# TERNARY OPERATOR

=begin
Ruby has an option for short and concise 'if' CONDITIONAL statements.
The TERNARY OPERATOR makes quick 'if/else' statements easy and keeps
everything in one line. It uses a combination of '?' and ':', let's
see this in action below.

[1] pry(main)> true ? "True" : "False"
=> "True"
[2] pry(main)> false ? "True" : "False"
=> "False"

So what happens? Ruby first looks at what is to the left of the '?',
if it's 'true' it goes to whatever is to the LEFT of the ':' and
executes it, if it's 'false' it goes to whatever is to the RIGHT
of the ':' and executes it. TERNARY OPERATORs will come to our aid later
on as we gain more familiarity with 'if' statements.

# CASE STATEMENT

=begin
CASE STATEMENTs are similar to an 'if' statement but has a slightly
different interface. They use the reserved words 'case', 'when', 'else',
and 'end'. We create one by first definining a case and then evaluating
the value of the CASE and what operation to complete if that case is
true. Let's see how this works.
=end

a = 5

case a
when 5
  puts "a is 5"
when 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end

# Looks similar to one of our previous 'if/elsif/else' statements right?

puts "----"

# What's cool is that we can also save the result of a CASE STATEMENT
# into a variable, so let's refactor our code above to do that, let's
# refactor so that we don't have to have 'puts' in all three lines.

a = 6

answer = case a
when 5
  "a is 5"
when 6
  "a is 6"
else
  "a is neither 5, nor 6"
end

puts answer

# By assigning the case to variable 'answer' we saved ourselves from
# writing out 'puts' in every line. We just called the variable with
# 'puts' after ending the CASE STATEMENT.

puts "----"

# We can also execute a CASE STATEMENT without giving an argument.

a = 4

answer = case
when a == 5
  "a is 5"
when a == 6
  "a is 6"
else
  "a is neither 5, nor 6"
end

puts answer

# In the above example we did not give the CASE STATEMENT an argument,
# but we added it as a boolean to 'when'.
