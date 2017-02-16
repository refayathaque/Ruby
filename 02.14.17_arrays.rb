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
So what happened above? The 'destructive' method perfomed a DESTRUCTIVE
action (pop) on its argument, and modified 'array4', even though 'array4'
was initialized outside the method. So the element '10' was popped out of
the orginal array. The 'nondestructive' method performed a NON DESTRUCTIVE
action (select), leaving what the 'destructive' method modified unchanged.
=end
