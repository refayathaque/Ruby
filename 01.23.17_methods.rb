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
to a method to be modified or used to RETURN a specific
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
is available to as it is in the outer scope. *** METHODs
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
  array.pop # 'pop' removes the last element in an array
end

p "Before mutate method #{a}" # Outputs [1, 2, 3, 4, 5]
mutate(a)
p "After mutate method #{a}" # Outputs [1, 2, 3, 4]

puts "----"

=begin
In the above example we demonstrated MUTATING THE CALLER, or
permanently altering a variable outside the method's scope. The 'pop'
method MUTATEs THE CALLER, not all METHODs do however (as we shall
see in the next example). METHODs which MUTATE THE CALLER, such as
'pop' are exempted from the Variable Scope Rule. There is no way to
know which METHODs are exempted and which are not, we will just have
to learn along the way. So 'pop' MUTATEs THE CALLER and we can see
this because after the ARGUMENT was passed into the 'mutate' method
what was outputted was an altered version of our [1, 2, 3, 4, 5]
array, it became [1, 2, 3, 4]. So from this we can gather that 'pop'
removes the last element in an array. More imporantly, 'pop' is a
method that can MUTATE THE CALLER, it can permanently change a variable
outside the method's scope. So now the variable 'a' is permanently
altered outside the METHOD's scope, and is accesible to command
'p "After mutate method #{a}"' which is in the outer scope.
=end

=begin
Like previously mentioned, there are only a handful of METHODs which
can MUTATE THE CALLER. Demonstrated below is an example using the
'last' METHOD, it does not MUTATE THE CALLER and follows the Variable
Scope Rule.
=end

b = [6, 7, 8, 9, 10]

def no_mutate(array)
  array.last # 'last' RETURNs the last element in an array
end

p "Before no_mutate method: #{b}" # Outputs [6, 7, 8, 9, 10]
no_mutate(b)
p "After no_mutate method: #{b}" # Outputs [6, 7, 8, 9, 10]

puts "----"

=begin
In the above example we did not MUTATE THE CALLER, in other words
we did not permanently alter the variable outside the method's scope.
So we know that the method 'last' does not MUTATE THE CALLER. 'last'
RETURNs the last element in an array but it does not have the ability
to permanently alter a variable outside it's scope, or in the outer
scope. For this reason when we called the array 'b' to be passed
into the 'no_mutate' METHOD we got the same output as had we
not passed 'b' into the METHOD, we got the the value of 'b' which
is [6, 7, 8, 9, 10]. Now, if the METHOD 'last' had the cpability
to MUTATE THE CALLER, the output for 'p "After no_mutate method: #{b}"'
would have been "10". This METHOD 'last' holds true the Variable Scope
Rule, which states that the inner scope has access to the outer but
not vice versa. The 'no_mutate' METHOD does affect the variable 'b'
with 'array.last', 'array.last' RETURNs only the last element in the
array. However, that does not influence the command 'p "After no_mutate
method: #{b}"' because 'array.last' is a METHOD which does not MUTATE
THE CALLER. The command 'p "After no_mutate method: #{b}"' is in the
outer scope, and cannot access the whatever manipulation is occuring
to the variable 'b' within the 'no_mutate' METHOD because that is
scoped at the METHOD level, or in the inner scope. So the command
'p "After no_mutate method: #{b}"' outputs what it has access to, the
orginal version of variable 'b' ([6, 7, 8, 9, 10]) sitting in the
outer scope.
=end

# 'PUTS' VS 'RETURN'

=begin
Every METHOD RETURNs the evaluated result of the last line executed,
and we will demonstrate this using the example from before which
MUTATEs THE CALLER.
=end

a = [1, 2, 3]

def mutate(array)
  array.pop # 'pop' removes the last element in an array and RETURNs it
end

p "Before mutate method: #{a}"
p mutate(a) # This is different from the example above, there is a 'p'
# in front. The 'p' will print out the value of whatever is RETURNed.
p "After mutate method: #{a}"

=begin
We're using the 'p' METHOD in this example to print out the value of
whatever the 'mutate' METHOD RETURNs. The output will look as such:

"Before mutate method: [1, 2, 3]"
3
"After mutate method: [1, 2]"

Here is what happened in sequence: We output 'a' as we initially
defined it ([1, 2, 3]). Then we output the value RETURNed by the
'mutate' METHOD's 'array.pop' code, which was 3. Finally, we output
the 'a' in it's permanently altered form as a result of the 'mutate'
METHOD ([1, 2]). In the second line we are seeing "3" because the
METHOD is RETURNing the result of 'array.pop' back to where it's being
called from. Keep in mind that 'pop' is a METHOD that removes the
last element of an array and RETURNs it, key here is 'RETURNs'.
=end

puts "----"

# Another RETURN example

def add_three(number)
  number + 3
end

returned_value = add_three(4)
puts returned_value

puts "----"

=begin
In the above example we're saving the RETURNed value of the 'add_three'
METHOD in a variable called 'RETURNed_value'. We then output the
'RETURNed_value' to see that it is 7. Nothing unexpected here. *** It's
important to remember that Ruby METHODs always RETURN the evaluated
result of the last line of the expression, UNLESS an explicit 'RETURN'
comes before it (in which case nothing after the line with the 'RETURN'
will be RETURNed). If we want to explicitly RETURN a value we must use
the 'RETURN' keyword, and this is demonstrated below.
=end

def add_three(number)
  return number + 3 # Added 'RETURN' to 'number + 3'
end

returned_value = add_three(4)
puts returned_value

puts "----"

# Over here we got the same "7" as the example preceding. What will
# we get if we changed it again? Let's try this below.

def add_three(number)
  return number + 3
  number + 4 # Added this new line to the METHOD's block
end

returned_value = add_three(4)
puts returned_value

puts "----"

=begin
Okay, so we got the same "7" as the previous two examples, despite
adding in the 'number + 4' line to the METHOD's block. Why is this?
This happened because when you have 'RETURN' in the block the METHOD
will ONLY execute the part with the 'RETURN' keyword and nothing else.
When we inserted the 'RETURN' keyword in the middle of the METHOD,
it just RETURNed the evaluated result of 'number + 3' (= 7) without
executing the next line which is 'number + 4'.
=end

=begin
One of the key things we must take away from this is that the 'RETURN'
reserved word is NOT required to RETURN something from a METHOD. It's
just a feature of Ruby. Let's look at this in the example below.
=end

def just_assignment(number)
  foo = number + 3
end

just_assignment(2) # In PRY this will RETURN "5" and we can see it, but
# in the terminal it won't output anything because there isn't the
# explicit 'puts', 'print', or 'p'.

=begin
Running the above METHOD as part of 'ruby 01.23.17_methods.rb' won't
output anything to the terminal, because we have not included a 'puts',
'p', or 'print' to our call 'just_assignment(2)'. However, if we were
to run this in the PRY Runtime Developer Console then "5" would be
RETURNed. When you run this file in the terminal "5" is being RETURNed,
but you cannot see it because it's not being printed/output, as there
is no explicit command of 'puts', 'p', or 'print'. However, what this
shows is that that the 'RETURN' reserved word is NOT required to RETURN
something from a METHOD. It's just a feature of Ruby.
=end

# CHAINING METHODS

=begin
Since we now know that every METHOD RETURNs something, we can try to
CHAIN METHODs together. CHAINing METHODs together allow us to write
very expressive and succint code. Let's look at the METHOD below.
=end

# Example of a CHAINed METHOD

def add_three(n)
  n + 3
end

add_three(5).times { puts 'this will print 8 times' } # We can keep
# calling METHODs on the RETURNed value, in this case the RETURNed
# value is 8. We are calling the 'times' METHOD on the RETURNed
# value of 'add_three(5)', which is 8. 'times' iterates the given
# block a certain number of times (number the block evaluates to).
# 'add_three(5).times { puts 'this will print 8 times' }' is an
# example of a CHAINed METHOD.

puts "----"

=begin
If we were to run this in the terminal we would get 8 lines of "this
will print 8 times", and that's it. We shouldn't expect an "8" at the
end because "8" is simply being RETURNed and not printed/output, as
we did not include 'puts'/'print'/'p'. However, if we were to do this
in PRY you would see the "8" below the 8 lines of "this will
print 8 times". The above example was one example of a CHAINed METHOD,
and there are other ways we can CHAIN METHODs, as we can see below.
=end

# Another example of a CHAINed METHOD

"hi there".length.to_s # Will RETURN, not output, the string "8", not
# the integer "8" but the STRING "8". If it was the integer "8" it
# would not have been in double quotations when run on PRY. Since
# it is in double quotations we know it's a STRING and not an integer.

=begin
In the above example the CHAINed METHOD has a string then two METHODs.
The METHOD 'length' RETURNs the character length of a string, and
'to_s' converts the receiver to a string object.
=end

# Back to our original CHAINed METHOD example on line 351, except this
# time around we will make one significant change.

def add_three(n)
  puts n + 3 # We're adding a 'puts' this time around. 'puts' will
  # output the incremented value, instead of implicitly RETURNing it.
end

 # add_three(5).times { puts 'this will print 8 times' } - [Commented
 # out because it results in an error.]

=begin
We run the code in the terminal to find that we output "8", but
now the CHAINed METHOD isn't working. We get the error message
"undefined method `times' for nil:NilClass (NoMethodError)". What
could have happened? According to the error message we got a 'nil'
as a result of the addition of 'puts' in our 'add_three' METHOD block,
and 'nil's don't know how to respond to a 'times' METHOD. Why did we
get a 'nil'? To find out, let's try running the code again but this
time without the 'times' METHOD attached, and in PRY so we can
see why we're getting a 'nil'.
=end

# Done in PRY

def add_three(n)
  puts n + 3
end

add_three(5) # In PRY we get "8" as the output and our RETURNed value
# is 'nil', but why are we getting 'nil'?

=begin
We just have to acknowledge that `puts` ALWAYS RETURNs 'nil'. If we
try `print` we see that it ALSO RETURNs 'nil', but `p` does NOT RETURN
'nil'. These are things we just have to remember going forward. So in
our 'add_three' METHOD, since METHODs RETURN the last line of the METHOD
(unless we explicitly ask to RETURN something), our RETURN value ends
up being what is RETURNed by 'puts n + 3', which is 'nil'. As a result
of this 'nil' we cannot use the 'add_three' METHOD to CHAIN METHODs
anymore. *** It's important to keep in mind that when CHAINing METHODs
the entire CHAINed call will break down if we run into a 'nil'.
=end

puts "----"

=begin
So how do we fix the code above? One way we can circumvent the problem
we ran into with 'nil' is by making sure that the line with `puts` is
NOT the last line. We know that `puts` always RETURNs 'nil', and that
the last line in a METHOD is always RETURNed unless explicitly asked
to RETURN something in previous lines with the reserved word 'RETURN'.
Therefore, we must make sure that `puts` is NOT being RETURNed, and we
do that by simply making sure that the line with `puts` is NOT the last
line.
=end

def add_three(n)
  puts n + 3 # Does NOT RETURN 'nil' as it's not the last line
  n + 3 # RETURNs "8", and we'll be able to see it only in PRY
end

add_three(5).times { puts 'this will print 8 times' } # Outputs 8 times

=begin
It works this time around because we made sure that 'puts n + 3' was
NOT the last line, and since it wasn't the last line 'puts n + 3' wasn't
RETURNed, and therefore prevented us from having to deal with a 'nil'.
When we have 'nil's our CHAINed calls break down and we get errors.
'n + 3' is the last line in the block and it is implicitly RETURNed, as
we can see if we were to run this in PRY.
=end

puts "----"

# METHODS AS ARGUMENTS

# Example 1, we will define 'add' and 'subtract' METHODs and call them.

def add(a, b)
  a + b
end

def subtract(c, d)
  c - d
end

p add(17, 3) # Outputs 20
p subtract(27, 7) # Outputs 20

=begin
The example above looks straight-forward, but what isn't (and can be
quite confusing if not done correctly) is that Ruby allows us to pass
METHOD calls as an ARGUMENT to other METHODs. In other words, if we
wanted, we can pass 'add(17, 3)' and 'subtract(27, 7)' as ARGUMENTs
to ANOTHER METHOD. We will do this in the example below.
=end

puts "----"

# Example 2, passing METHOD calls as an ARGUMENT to other METHODs.

def multiply(e, f)
  e * f
end

p multiply(add(17, 3), subtract(27, 7)) # Outputs 400

puts "----"

# Example 3, similar to above but more complicated.

p add(subtract(27, 7), multiply(subtract(27, 7), add(17, 3)))
# Outputs 420

=begin
Let's break down the complicated example above. First we passed to the
'add' METHOD two ARGUMENTs: 'subtract(27, 7) and 'multiply(subtract(27,
7), add(17, 3))'. The first ARGUMENT, the 'subtract' METHOD, RETURNs 20.
The second ARGUMENT, the 'multiply' METHOD call, actually has two
ARGUMENTs: 'subtract(25, 7)' and 'add(17, 3)', and what this whole
thing RETURNs is 20 * 20, or 400. Finally, 'add(20, 400)' and what is
RETURNed (then output since we have the 'p') is 420. *** A very
important thing to be aware of when using nested METHODs is the use
of parenthesis, use them correctly to avoid confusion.
=end

=begin
We see that METHOD calls always RETURN a value, and we can pass that
METHOD call as an ARGUMENT to another METHOD based on the RETURNed
value. So, it is crucial to know what our defined METHODs are RETURNing,
because in the final analysis that's what is actually being passed as
ARGUMENTs to other METHODs.
=end

# SUMMARY

=begin
Knowing the difference between `puts` and `return` will help us avoid
the common beginners' pitfalls. Knowing how and when to use METHOD
CHAINing will help us better read code and write more succint code, but
we must be careful about thos 'nil's.
=end
