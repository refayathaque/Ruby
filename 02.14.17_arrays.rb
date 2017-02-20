# ARRAYs

=begin
ARRAYs are ORDERED lists of elements, elements that can be of any type. We
define an ARRAY by placing a list of elements between [...] brackets. As
mentioned above, ARRAYs can have elements of any type, we can have an ARRAY
of strings, integers, floats, and even OTHER ARRAYs all in one ARRAY. Let's
play around with an array that has different types of elements.
=end

array = [1, 'Refayat', 2.345, 'Haque', [6, 7]]
puts array # Lists the elements vertically, without qutoations for the
           # string elements, the ARRAY element [6, 7] SEPARATED, and no
           # [...]s. RETURNs 'nil'.

puts "----"

p array # Lists the elements horizontally to appear exactly like how we
        # have it defined above (identical syntaxtually). RETURNs the same.
        # [1, 'Refayat', 2.345, 'Haque', [6, 7]] -> Output AND RETURNED

puts "----"

# We can get the first element of an array using the Array#first method
# ('first' is an INSTANCE method). Similarly, we can get the last element
# using the Array#last method.

p array.first # Outputs 1
p array.last # Outputs [6, 7]

puts "----"

# What if we want to get the third element? ARRAYs are INDEXED lists, that
# means each slot in an array is numbered. We can reference any element
# using its index number. Below are some examples.

p array[0] # Outputs 1 *** Remember, lists in Ruby start at 0, not 1...
p array[3] # Outputs 'Haque'
p array[4] # Outputs [6, 7]
puts array[4] # Outputs 6 then 7. Notice the difference here? [6, 7] is
              # SEPARATED with 'puts', making the output different from
              # 'p array[4]'.

puts "----"

# MODIFYING ARRAYs

=begin
Say we wanted to add or remove things from an ARRAY, how do we go about
doing that? There are a couple of Array methods we can use. If we want
to PERMANENTLY remove the last item of an array we can use Array#pop. It's
important to note that when we call the Array#pop method we are MODIFYING
the orginal 'array' variable, we say such methods MUTATEs THE CALLER. When
using Array#pop what is RETURNED is the popped element (last element in the
ARRAY).
=end

p array.pop # Outputs the popped element, or the last element in the ARRAY,
            # in our case being [6, 7].
p array # Outputs [1, 'Refayat', 2.345, 'Haque'], since the last element
        # [6, 7] was PERMANENTLY removed. Array#pop MUTATEs THE CALLER.

puts "----"

# If we want to add [6, 7] back to the array PERMANENTLY, we can use the
# Array#push method and send it the parameters we want to add.

p array.push([6, 7]) # Outputs [1, 'Refayat', 2.345, 'Haque', [6, 7]]
p array # Outputs [1, 'Refayat', 2.345, 'Haque', [6, 7]], we did this to
        # check if the addition was PERMANENT, and it was, allowing us to
        # say that Array#push is a method that MUTATEs THE CALLER.

# We can also use the shovel operator (<<) to add elements. This also
# MUTATEs THE CALLER (makes the addition PERMANENT).

p array << 'Ruby' # Outputs [1, "Refayat", 2.345, "Haque", [6, 7], "Ruby"]

puts "----"

=begin
Array#map is a method that iterates over an array and applies a block to
each element, it then RETURNs a new array with those results. Array#collect
is an alias to Array#map, they do the same thing. Let's see this in action.
=end

# We will square elements in an array with Array#map, then we will cube
# elements with Array#collect.

array1 = [2, 4, 6, 8]

p array1.map { |element| element**2 } # Outputs [4, 16, 36, 64]

p array1.collect { |element| element**3 } # Outputs [8, 64, 216, 512]

# These two methods DOESN'T MUTATE THE CALLER. We know this because there
# is no change to array1, these two methods are NOT DESTRUCTIVE.

puts "----"

=begin
Array#delete_at is a method used to eliminate the value at a certain index
in ARRAYs. We should be careful with this method because it modifies an
ARRAY DESTRUCTIVELY, in other words, it MUTATEs THE CALLER. Once we call
this method we are changing our ARRAY PERMANENTLY. Let's see this in play.
=end

p array1.delete_at(1) # Outputs 4, value that has been deleted PERMANENTLY
                      # Also RETURNs 4
p array1 # Outputs [2, 6, 8], this shows that 4 was PERMANENTLY removed.

puts "----"

# Sometimes we'll know the value we want to delete, but not the index, in
# such situations we will use Array#delete. Array#delete PERMANENTLY
# deletes ALL INSTANCES of the provided value from the array. This method
# MUTATEs THE CALLER, and is DESTRUCTIVE.

array2 = [1, "Hello", 2.345, 2.345, "Ruby", [6, 7]]
p array2.delete(2.345) # Outputs 2.345
p array2 # Outputs [1, "Hello", "Ruby", [6, 7]] # 2.345 (both instances)
         # were PERMANENTLY removed, and are no longer elements in array2.

puts "----"

# Another useful method is Array#uniq, this iterates through an ARRAY and
# deletes duplicate values, then RETURNs the result as a new ARRAY.
# But this method is NOT DESTRUCTIVE. This method will not modify the
# original ARRAY, it will RETURN a new array with the duplicates removed.

array3 = [1, 2, 3, 3, 3, 4, 5, 6]
p array3.uniq # Outputs [1, 2, 3, 4, 5, 6], we can see that two out of
              # the three '3' elements are no longer there.
p array3 # Outputs [1, 2, 3, 3, 3, 4, 5, 6], the original array, proving
         # that the method is indeed NOT DESTRUCTIVE.

puts "----"

=begin
Can we perform Array#uniq DESTRUCTIVELY? Yes we can, using the BANG
OPERATOR (!) appended to Array#uniq, so Array#uniq! is DESTRUCTIVE.
Array#uniq and Array#uniq! are two DIFFERENT Ruby ARRAY methods, we must
keep this very important distinction in mind. *** We cannot simply append
the BANG OPERATOR (!) onto any method and make it DESTRUCTIVE.
=end

p array3.uniq! # Outputs [1, 2, 3, 4, 5, 6], expected as per 'uniq' doc
p array3 # Outputs [1, 2, 3, 4, 5, 6], proving 'uniq!' is DESTRUCTIVE

puts "----"

# ITERATING OVER AN ARRAY

# Array#select iterates over an array then RETURNs a new array which
# includes any items that RETURN 'true' to the expression provided.

array4 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

p array4.select { |element| element >= 7 } # Outputs [7, 8, 9, 10]
p array4 # Outputs [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], original 'array4' is
# unmodified. DOES NOT MUTATE THE CALLER, method is NOT DESTRUCTIVE.

puts "----"

# METHODs WITH A !

=begin
The BANG OPERATOR (!) at the end of a method USUALLY indicates that the
method will MUTATE THE CALLER (This is NOT ALWAYS the case however).
*** It is prudent to check the documentation of any method with a BANG
OPERATOR to see if it will MUTATE the CALLER. Interestingly, there are
methods like Array#pop and Array#push that are DESTRUCTIVE but do not
have the BANG OPERATOR.
=end

# MUTATING THE CALLER: THE SEQUEL

# Let's do an example involving methods, a DESTRUCTIVE, and a NON
# DESTRUCTIVE method.

def destructive(array)
  array.pop
end

def nondestructive(array)
  array.select { |element| element >= 4 }
end

destructive(array4)
nondestructive(array4)

p array4 # Outputs [1, 2, 3, 4, 5, 6, 7, 8, 9]

=begin
So what happened above? The 'destructive' method performed a DESTRUCTIVE
action (pop) on its argument, and modified 'array4', even though 'array4'
was initialized outside the method (?). So the element '10' was popped out
of the orginal array. The 'nondestructive' method performed a NON
DESTRUCTIVE action (select), leaving what the 'destructive' method
previously modified unchanged.
=end

puts "++++"

# IMPORTANT ASIDE ON VARIABLE SCOPE

a = 1         # Outer scope variable initialized

loop do       # The block creates an inner scope
  puts a      # Outputs 1
  a = a + 1   # 'a' is re-assigned to a new value
  break       # Necessary to prevent infinite loop
end

puts a        # Outputs 2, "a" was re-assigned in the inner scope. Outer
              # scope only has access to outer scope (not inner scope).
              # Since "a" was initialized in the outer scope, we have
              # access to it here.

=begin
`Block` scope is different from `Method` scope. Quoting the lesson statement:
"Methods have no notion of "outer" or "inner" scope -- you must explicitly
pass in any parameters to methods.” When you have a `block` scope it creates
an inner scope, and this is when the Variable Scope Rule, ”Inner Scope can
access the Outer Scope, but not vice versa”, becomes applicable.
=end

puts "++++"

# NESTED ARRAYs

# NESTED ARRAYs are ARRAYs within ARRAYs, we can use NESTED ARRAYs if we
# wanted to keep track of sand volleyball teams for example.

teams = [["Timmy", "Harriet"], ["John", "Lisa"], ["Katie", "Harold"]]

# We can find teams by index, say we want to find the 2nd team.

p teams[1] # Outputs ["John", "Lisa"]

puts "----"

# COMPARING ARRAYs

# We can compare ARRAYs for equality using the '==' operator

array5 = [1, 2, 3, 4, 5]
array6 = [1, 2, 3, 4]
# array7 = [1, 2, 3, 4]

def thesame?(array)
array7 = [1, 2, 3, 4]
  if array == array7 # array7 must be initialized inside the method for
                     # the method to have access to it, can't access if
                     # it's initialized in the outer scope like what is
                     # commented out above.
    puts "Array passed as argument is same as array7"
  else
    puts "Array passed as argument is NOT same as array7"
  end
end

thesame?(array5) # [1, 2, 3, 4, 5] != [1, 2, 3, 4]
thesame?(array6) # [1, 2, 3, 4] == [1, 2, 3, 4]

=begin
The example above demonstrates something we have not encountered before,
and that is VARIABLE SCOPE as it applies to METHODs (NOT BLOCKs). The rule
we learnt earlier, "Inner Scope can access Outer Scope, but not vice versa"
does NOT APPLY for METHODs. METHODs have their OWN VARIABLE SCOPE. If we
need our METHODs to be able to access a variable (above we needed it to
access array7) then it must be initialized in the INNER SCOPE (inside the
METHOD). Code in the OUTER SCOPE (outside of the METHOD), CANNOT ACCESS
variables initialized in the INNER SCOPE (inside the METHOD). So OUTER can
ONLY access OUTER, and INNER can ONLY access INNER, unlike with BLOCKs.
We can PASS INTO the METHOD variables initialized in the OUTER SCOPE, and
that's what we've done above, but the METHOD traditionally cannot access
variables initialized in the OUTER SCOPE.
=end

puts "----"

# An important method to know about is Array#unshift, it is a method
# which MUTATEs THE CALLER (DESTRUCTIVE), and is used to add elements to
# the beginning of an array.

array8 = [2, 3, 4, 5]

# Say we want to add a '1' to the beginning of 'array8'.

array8.unshift(1) # RETURNs [1, 2, 3, 4, 5]
p array8 # Outputs [1, 2, 3, 4, 5], proving that the method is DESTRUCTIVE.

puts "----"

# COMMON ARRAY METHODs

# Array#include? is a method used to check if the argument given is inside
# an array. Having a question mark at the end of a method USUALLY implies
# that a boolean value will be RETURNED, *** just like the BANG OPERATOR
# this is strictly by convention only and NOT a property of the language.

p array8.include?(2) # Outputs 'true'

puts "----"

# Array#flatten is used to take an array with nested arrays and create a
# one-dimensional array. 'Flatten' appropriately describes the action.

array9 = [1, 2, 3, ["Ruby", "Is", "Fun"], ["Hello", "Bye"]]

p array9.flatten # Outputs [1, 2, 3, "Ruby", "Is", "Fun", "Hello", "Bye"]
p array9 # Outputs [1, 2, 3, ["Ruby", "Is", "Fun"], ["Hello", "Bye"]],
         # proving that the method is NOT DESTRUCTIVE.

puts "----"

# Array#flatten! is another method that IS DESTRUCTIVE, and MUTATEs THE
# CALLER. Let's try it out.

p array9.flatten! # Outputs [1, 2, 3, "Ruby", "Is", "Fun", "Hello", "Bye"]
p array9 # Outputs [1, 2, 3, "Ruby", "Is", "Fun", "Hello", "Bye"],
         # proving that the method IS DESTRUCTIVE, and MUTATEs THE CALLER.

puts "----"

# Array#each_index iterates through an array, and the variable represents
# the index number instead of the value at each index. It passes the index
# of the element into the block and we can do whatever we want with it.
# The original ARRAY is returned.

array9.each_index { |indexnumber| puts "Index #{indexnumber}"}

puts "----"

# Array#each_with_index is more useful than the method above. It allows us
# to manipulate both the value and the index by passing in two parameters
# to the block, the first is the value and the second is the index. We
# can use them in the block. Let's try this.

# Let's list out the winners of a swimming competition.

standings = ["Michael", "Katie", "Jane", "Eduardo", "George"]

standings.each_with_index { |name, index| puts "#{index + 1}. #{name}"}

# We get a list of winners with their names and corresponding standings.

puts "----"

# We can use Array#sort to...well, sort an Array. Let's see below.

array10 = [1, 3, 6, 34, 2, 4, 6, 8, 3, 4, 5]
p array10.sort # Outputs [1, 2, 3, 3, 4, 4, 5, 6, 6, 8, 34]
p array10 # Outputs [1, 3, 6, 34, 2, 4, 6, 8, 3, 4, 5], so this method is
          # not DESTRUCTIVE, it doesn't MUTATE THE CALLER. Array#sort only
          # RETURNs new data, doesn't modify the original data.

puts "----"

# What about Array#sort!? Let's see.

p array10.sort! # Outputs [1, 2, 3, 3, 4, 4, 5, 6, 6, 8, 34]
p array10 # Outputs [1, 2, 3, 3, 4, 4, 5, 6, 6, 8, 34], so Array#sort! is
          # DESTRUCTIVE as it MUTATEs THE CALLER. It modifies the original
          # data.

puts "----"

# *** Methods that MUTATE THE CALLER -> Modify the original data
# *** Methods that DO NO MUTATE THE CALLER -> Only RETURN new data

# Array#product is used to combine two arrays, this is done in a way
# similar to the distributive property we know of from Algebra. Let's see.

array11 = [1, 2, 3]
array12 = [4, 5, 6]

p array11.product(array12) # Outputs what is below:
      # [[1, 4],[1, 5],[1, 6],[2, 4],[2, 5],[2, 6],[3, 4],[3, 5],[3, 6]]

puts "----"

# EACH VS MAP

=begin
Array#each is a simple way of iterating over a collection in Ruby, and is
preferred over using the 'for' loop. Array#each is commonly used along a
block. If given a block, Array#each runs the code in the block for each
element in the collection and RETURNs the collection (original data,
unmodified) it was invoked on. *** If no block is given, Array#each
RETURNs an ENUMERATOR. Let's try some examples.
=end

array12.each { |element| puts element**2 }
# This will output '16, 25, and 36' but will RETURN [4, 5, 6]

puts "----"

p array12.each # RETURNs #<Enumerator: [4, 5, 6]:each> because there is
               # NO BLOCK. Outputs RETURNED value (^) because of 'p'.

puts "----"

=begin
Array#map is similar to Array#each, where it's different is in what is
RETURNED. Array#map RETURNs a new array containing the values RETURNED
by the block, while Array#each RETURNs the original unmodified array.
=end

=begin

In PRY

[1] pry(main)> array = [2, 4, 6, 8]
=> [2, 4, 6, 8]
[2] pry(main)> array.map { |int| int**2 }
=> [4, 16, 36, 64] RETURNs a new array containing the values RETURNED
                   by the block
[3] pry(main)> array.each { |int| int**2 }
=> [2, 4, 6, 8] RETURNs the original unmodified array

=end

# Let's further examine Array#map, and see what is RETURNED with ::puts.

=begin

In PRY

[1] pry(main)> array = [2, 4, 6, 8]
=> [2, 4, 6, 8]
[2] pry(main)> array.map { |int| puts int**2 }
4
16
36
64
=> [nil, nil, nil, nil]

We know that ::puts ALWAYS RETURNs 'nil', over here our block with ::puts
was invoked and 'nil' was RETURNED which makes up the values in the newly
created RETURNED array.

=end

=begin
Say we want to replace an element in an array with something else, how do
we go about doing this? We can do this by setting the value of an item in
an array using the index as a key. Below we have an array of names, and we
want to replace 'Margaret' with 'Jody', how would we do this?
=end

names = ['George', 'Bernard', 'Margaret', 'Abigail']
names[2] = 'Jody'

p names # Outputs ['George', 'Bernard', 'Jody', 'Abigail']
