=begin
When we have a piece of code that must be executed
many times we can use a METHOD. We begin a METHOD first by
defining it with the reserved word `def`, we then follow it
with a name for the METHOD. Finally, we end our METHOD with
the reserved word `end`.
=end

# Example that executes `puts` multiple times

def says(words) # (words) is known as the PARAMETER
  puts words
end

says("Hello Refayat") # (...) is known as the ARGUMENT
says("You have to work very hard to learn Ruby well")
says("It'll take perserverance and unwavering commitment")

puts "----"

# We used a METHOD above instead of doing the following:

puts "Hello Refayat"
puts "You have to work very hard to learn Ruby well"
puts "It'll take perserverance and unwavering commitment"

puts "----"

# By using a METHOD we made our program more FLEXIBLE!

=begin
PARAMETERs are used when we have data outside the
the METHOD's scope, and we need to give the outside data
access to be used inside the METHOD's scope. In our METHOD
above we needed to give the ARGUMENTs outside the METHOD's
scope (IE data NOT within the block) access to the METHOD's
inner scope, and that's why we needed the PARAMETER. It's
important to give PARAMETERs meaningful and explicit names
so it's clear to others reading our code. | ARGUMENTs are
"passed" to a method when we call it, they are data sent
to a method to be modified or used to return a specific
result. In our example the first ARGUMENT is "Hello Refayat",
and it's "passed" to our METHOD 'says' when we call it.
When we pass the string "Hello Refayat" into the METHOD
it's being assigned to the variable 'words', and we can use
it in whatever way we want from within the METHOD. |
*** Important here to note that the 'words' variable is
scoped at the METHOD level ('words' is initiated inside the
METHOD block/within the METHOD scope [it's in the inner
scope, NOT outer]), and therefore, we cannot reference it
outside of the 'say' METHOD.
=end

=begin
When we call 'says("Hello Refayat")' we are passing in the
string "Hello Refayat" as the ARGUMENT which will take place
of the 'words' PARAMETER, then the block within the method
is run with the 'words' variable evaluated to "Hello Refayat"
=end

=begin
A benefit of METHODs is that it gives us the ability to make
changes in ONE place if we need to make changes in many
other places in our program. IE If we wanted to add a period
(.) to the end of the strings we pass to the `say` METHOD,
we have to make a change in only ONE place. Demonstrated below.
=end

def says(words)
  puts words + "."
end

says("Hello Refayat")
says("You have to work very hard to learn Ruby well")
says("It'll take perserverance and unwavering commitment")

puts "----"

# DEFAULT PARAMETERs

=begin
Whenever we're defining METHODs we want to make sure that it
always works, in case there are no ARGUMENTs being passed to
the PARAMETER. We must have a DEFAULT PARAMETER in case the
caller does not pass an ARGUMENT.
=end

# Let's REFACTOR our code above with a DEFAULT PARAMETER

def says(words="Hello Refayat") # DEFAULT PARAMETER
  puts words + "."
end

says()
says("You have to work very hard to learn Ruby well")
says("It'll take perserverance and unwavering commitment")

# 'says()' prints "Hello Refayat." because we provided a
# DEFAULT PARAMETER which is used when we call our METHOD
# without an ARGUMENT.

puts "----"

# MUTATING THE CALLER

=begin
We are MUTATING THE CALLER when an ARGUMENT is changed
permanently. *** Before proceeding it's important to keep
in mind that METHOD ARGUMENTs are scoped at the METHOD
level (within the block of the METHOD/INNER SCOPE). This
is demonstrated in the example below.
=end

def some_method(number)
  number = 7
end

a = 5
some_method(a)
puts a # Outputs 5 and NOT 7, because ARGUMENT was not
# changed, OUTER SCOPE has no access to INNER SCOPE.

=begin
In our code above we passed 'a' to the 'some_method' METHOD.
In 'some_method', the value of 'a' is assigned to the variable
'number', and the variable is scoped at the METHOD level (within
the block of the METHOD/INNER SCOPE). 'number' is reassigned
the value "7" but it did not affect 'a's value because 'number'
is scoped at the method level. 'puts a', being in the OUTER
SCOPE, does not have access to the 'number' variable because
it's in the INNER SCOPE. So 'puts a' outputs 5 because 'a = 5'
is available to as it is in the OUTER SCOPE. *** METHODS
cannot modify ARGUMENTs passed in to them permanently...
UNLESS we MUTATE THE CALLER.
=end
