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

# MODIFYING ARRAYs
