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
level (within the block of the METHOD/inner scope). This
is demonstrated in the example below.
=end

def some_method(number)
  number = 7
end

a = 5
some_method(a)
puts a # Outputs 5 and NOT 7, because ARGUMENT was not
# changed, outer scope has no access to inner scope.

puts "----"

=begin
In our code above we passed 'a' to the 'some_method' METHOD.
In 'some_method', the value of 'a' is assigned to the variable
'number', and the variable is scoped at the METHOD level (within
the block of the METHOD/inner scope). 'number' is reassigned
the value "7" but it did not affect 'a's value because 'number'
is scoped at the method level, 'a' could not be altered permanently.
'puts a', being in the outer scope, does not have access to the
'number' variable because it's in the inner scope. So 'puts a'
outputs 5 because 'a = 5' (not altered permanently by the method)
is available to as it is in the outer scope. *** METHODS
cannot modify ARGUMENTs passed in to them permanently...
UNLESS we MUTATE THE CALLER.
=end

=begin
When we perform some specific action on the ARGUMENT we can
permanently alter variables outside the method's scope, in other
words, we can MUTATE THE CALLER. For example, let's take the
variable 'a' which stores an array, and this variable is outside
the METHOD's scope (in the outer scope).
=end

# Example of METHOD modifying ARGUMENT permanently

a = [1, 2, 3, 4, 5]

def mutate(array)
  array.pop
end

p "Before mutate method #{a}" # Outputs [1, 2, 3, 4, 5]
mutate(a)
p "After mutate method #{a}" # Outputs [1, 2, 3, 4]

puts "----"

=begin
In the above example we demonstrated MUTATING THE CALLER, or
permanently altering a variable outside the method's scope. The 'pop'
method MUTATEs THE CALLER, not all methods do however (as we shall
see in the next example). METHODs which MUTATE THE CALLER, such as
'pop' are exempted from the Variable Scope Rule. There is no way to
know which methods are exempted and which are not, we will just have
to learn along the way. So 'pop' MUTATEs THE CALLER and we can see
this because after the argument was passed into the 'mutate' method
what was outputted was an altered version of our [1, 2, 3, 4, 5]
array, it became [1, 2, 3, 4]. So from this we can gather that 'pop'
removes the last element in an array. More imporantly, 'pop' is a
method that can MUTATE THE CALLER, it can permanently change a variable
outside the method's scope. So now the variable 'a' is permanently
altered outside the METHOD's scope, and is accesible to command
'p "After mutate method #{a}"' which is in the outer scope.
=end

=begin
Like previously mentioned, not all methods MUTATE THE CALLER.
This is demonstrated below with an example using the 'last' method.
=end
