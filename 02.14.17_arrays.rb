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
           # [...]s. RETURNS 'nil'.

puts "----"

p array # Lists the elements horizontally to appear exactly like how we
        # have it defined above (identical syntaxtually). RETURNS the same.
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

p array.pop # Output the popped element, or the last element in the ARRAY,
            # in our case being [6, 7].
p array # Output [1, 'Refayat', 2.345, 'Haque'], since the last element
        # [6, 7] was PERMANENTLY removed. Array#pop MUTATEs THE CALLER.

puts "----"

# If we want to add [6, 7] back to the array PERMANENTLY, we can use the
# Array#push method and send it the parameters we want to add.

p array.push([6, 7]) # Output [1, 'Refayat', 2.345, 'Haque', [6, 7]]
p array # Output [1, 'Refayat', 2.345, 'Haque', [6, 7]], we did this to
        # check if the addition was PERMANENT, and it was, allowing us to
        # say that Array#push is a method that MUTATEs THE CALLER.

# We can also use the shovel operator (<<) to add elements. This also
# MUTATEs THE CALLER (makes the addition PERMANENT).

p array << 'Ruby' # Output [1, "Refayat", 2.345, "Haque", [6, 7], "Ruby"]

puts "----"

=begin
Array#map is a method that iterates over an array and applies a block to
each element, it then RETURNS a new array with those results. Array#collect
is an alias to Array#map, they do the same thing. Let's see this in action.
=end

# We will square elements in an array with Array#map, then we will cube
# elements with Array#collect.

array1 = [2, 4, 6, 8]

p array1.map { |element| element**2 }

array1.collect do |element|
  p element**3
end

# Why can't I get above to print out in [...] form?

puts "----"
