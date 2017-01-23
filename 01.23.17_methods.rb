=begin When we have a piece of code that must be executed
many times we can use a METHOD. We begin a METHOD first by
defining it with the reserved word `def`, we then follow it
with a name for the METHOD. Finally, we end our METHOD with
the reserved word `end`.
=end

# Example that executes `puts` multiple times

def says(words) # (words) is known as the PARAMETER
  puts words
end

says("Hello Refayat.") # (...) is known as the ARGUMENT
says("You have to work very hard to learn Ruby well.")
says("It'll take perserverance and unwavering commitment!")

puts "----"

# We used a METHOD above instead of doing the following:

puts "Hello Refayat."
puts "You have to work very hard to learn Ruby well."
puts "It'll take perserverance and unwavering commitment!"

# By using a METHOD we made our program more FLEXIBLE!

=begin PARAMETERs are used when we have data outside the
the METHOD's scope, and we need to give the outside data
access to be used inside the METHOD's scope. In our METHOD
above we needed to give the ARGUMENTs outside the METHOD's
scope (IE data NOT within the block) access to the METHOD's
inner scope, and that's why we needed the PARAMETER. It's
important to give PARAMETERs meaningful and explicit names
so it's clear to others reading our code. | ARGUMENTs are
"passed" to a method when we call it, they are data sent
to a method to be modified or used to return a specific
result. In our example the first ARGUMENT is "Hello Refayat.",
and it's "passed" to our METHOD 'says' when we call it.
When we pass the string "Hello Refayat." into the METHOD
it's being assigned to the variable 'words', and we can use
it in whatever way we want from within the METHOD. |
*** Important here to note that the 'words' variable is
scoped at the METHOD level ('words' is initiated inside the
METHOD block/within the METHOD scope [it's in the inner
scope, NOT outer]), and therefore, we cannot reference it
outside of the 'say' METHOD.
=end
