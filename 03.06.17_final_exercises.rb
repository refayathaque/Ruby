# 1. Use the `each` method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8
# 9, 10] and print out each value.

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

numbers.each do |element|
  puts element
end

puts "---"

# 2. Same as above, but only print out values greater than 5.

numbers.each do |element|
  if element > 5
    puts element
  end
end

# 3. Now, using the same array above, use the `select` method to extract all
# odd numbers into a new array.

# There are a few ways to do this...

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Using Integer#odd?

newarray1 = numbers.select { |element| element.odd? }
p newarray1

puts "----"

newarray2 = numbers.select do |element|
  element.odd?
end
p newarray2

puts "----"

p numbers.select { |element| element.odd? }

puts "----"

p numbers.select do |element| # Oddly, this doesn't work, even though it's
                              # exactly the same as the block above, just
                              # multi-line. We get Enumerator.
  element.odd?
end

puts "---"

p ( numbers.select do |element| # It works with the block in parentheses...
  element.odd?
end )

=begin
* Still don't understand this...03/07/17

"Curly braces have a high precedence; do..end has a low precedence. If the
method invocation has parameters that are not enclosed in parentheses, the
brace form of a block will bind to the last parameter, not to the overall
invocation. The do..end form will bind to the invocation."
- http://phrogz.net/ProgrammingRuby/language.html#blocksclosuresandprocobjects

Without the parentheses Ruby interprets the do..end block as:

`p (numbers.select) do |element|`.

We get Enumerator because it sees no block, it only sees `p (numbers.select)`.
It's printing an Enumerator and then passing a block that isn't used.
The do..end version gives the block to 'p' and not 'select'. It's calling
`p numbers.select` before the block is being evaluated.

'Precedence' can be thought of a little like arithmatic: the result of
(3 + 10 * 2) is 23, because MULTIPLICATION has a higher precidence than ADDITION
according to BODMAS/PEMDAS, and so the MULTIPLICATION expression gets evaluated
first. {} blocks have higher precedence than do..end blocks.
=end

puts "----"

# Can also be done using the Modulo operator

p numbers.select { |element| element % 2 != 0 }
# Any integer divided by 2 with NO REMAINDERs will be even, but any integer
# divided by 2 WITH REMAINDERs will be odd, hence the block above with '!='.

puts "----"

# Can also be done another way using Array#each.

odd = []

numbers.each do |element|
  if element.odd?
    odd.push(element)
  end
end

p odd

puts "----"

# 4. Append "11" to the end of the original array. Prepend "0" to the
# beginning.

p numbers.push(11)
p numbers # Just to show that Array#push is destructive.

puts "----"

p numbers.unshift(0)
p numbers # Just to show that Array#unshift is destructive.

puts "----"

# 5. Get rid of "11". And append a "3".

numbers.pop # or numbers.delete(11) or numbers.delete_at(11)
p numbers.push(3)

puts "----"

# 6. Get rid of duplicates without specifically removing any one value.

p numbers.uniq!

puts "----"

# 8. Create a Hash (key-value pairs) using both Ruby syntax styles.

hashnew = { 'Aston Martin': 'DB5', 'BMW': 'E32M3', 'Ferrari': 'F12Berlinetta'}
p hashnew
hashold = { :'Aston Martin'=> 'DB5', :'BMW'=> 'E32M3', :'Ferrari'=> 'F12Berlinetta'}
p hashold

puts "----"

# 9. Suppose you have a hash `h = {a:1, b:2, c:3, d:4}`. Get the value of
# key `:b`, add to the hash the key:value pair `{e:5}`, then remove all
# key:value pairs whose value is less than 3.5

hash = {a:1, b:2, c:3, d:4}

p hash[:b]

hash[:e] = 5
p hash

hash.delete_if do |key, value|
  value < 3.5
end
p hash

puts "----"

# 10. Can hash values be arrays? Can you have an array of hashes? Give
# examples.

hashwitharrayvalues = {a: [1, 2, 3], b: [4, 5, 6]}
arraywithhashvalues = [{a:1}, {b:2}]
p hashwitharrayvalues
p arraywithhashvalues

puts "----"

# 12. Given the following data structures. Write a program that moves the
# information from the array into the empty hash that applies to the correct
# person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"],
["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

contact_data.each do |element|
  if element.include?("joe@email.com")
    contacts["Joe Smith"] = element
  else
    contacts["Sally Johnson"] = element
  end
end

p contacts

puts "----"

=begin
Output:
{"Joe Smith"=>["joe@email.com", "123 Main st.", "555-123-4567"],
"Sally Johnson"=>["sally@email.com", "404 Not Found Dr.", "123-234-3454"]}

So we just moved the array elements (which are also arrays) to their respective
owners. But what if we wanted to have labels for the pieces of information? IE
'email address', 'address', and 'phone number'? We have to take another
approach. Let's try it out below.
=end

contactdata = [["joe@email.com", "123 Main st.", "555-123-4567"],
["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

people = {"Joe Smith" => {}, "Sally Johnson" => {}}

people["Joe Smith"][:emailaddress] = contactdata[0][0]
people["Joe Smith"][:homeaddress] = contactdata[0][1]
people["Joe Smith"][:phonenumber] = contactdata[0][2]
people["Sally Johnson"][:emailaddress] = contactdata[1][0]
people["Sally Johnson"][:homeaddress] = contactdata[1][1]
people["Sally Johnson"][:phonenumber] = contactdata[1][2]

p people

# We created NEW key-value pairs INSIDE the hashes that act as values to the
# keys "Joe Smith" and "Sally Johnson", instead of just inserting the
# elements (arrays containing our information) into the keys "Joe Smith" and
# "Sally Johnson". So our hash 'people' has two key-value pairs
# ("Joe Smith": {}, and "Sally Johnson": {}) with THEIR values being hashes
# with key-value pairs (emailaddress: "joe@email.com", etc.) INSIDE them.

puts "----"

# 13. Using the hash you created from the previous exercise, demonstate how
# you would access Joe's email and Sally's phone number.

puts "Joe's email address is #{people["Joe Smith"][:emailaddress]}"
puts "Sally's phone number is #{people["Sally Johnson"][:phonenumber]}"

puts "----"

# 14. In exercise 12, we manually set the contacts hash values one by one.
# Now, programmatically loop or iterate over the contacts hash from exercise
# 12, and populate the associated data from the contact_data array. Hint:
# you will probably need to iterate over ([:email, :address, :phone]), and
# some helpful methods might be the Array shift and first methods.

contact_datab = ["joe@email.com", "123 Main st.", "555-123-4567"]

contactsb = {"Joe Smith" => {}}

contact_datab.each do |element|
  if contact_datab[0] == element
    contactsb["Joe Smith"][:email] = element
  elsif contact_datab[1] == element
    contactsb["Joe Smith"][:address] = element
  else
    contactsb["Joe Smith"][:phone] = element
  end
end

p contactsb

# Above is one way to do it, but we didn't use the suggested methods.

contact_datac = ["joe@email.com", "123 Main st.", "555-123-4567"]

contactsc = {"Joe Smith" => {}}

contact_datac.each do |element|
  if contact_datac.first == element
    contactsc["Joe Smith"][:email] = element
  elsif contact_datac.last == element
    contactsc["Joe Smith"][:phone] = element
  else
    contactsc["Joe Smith"][:address] = element
  end
end

p contactsc

puts "----"

# Here we used Array#first, now let's try with Array#shift.
# Ok, everything up top is NOT what this problem is asking for, let's try
# again below. -_-

hash = {"Joe Smith"=>{}}

array = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarray = [:email, :address, :phone]

hash.each do |key, value|
  value[labelarray.shift] = array.first
  value[labelarray.shift] = array[1]
  value[labelarray.shift] = array.last
end

p hash

puts "----"

# Another way with ONLY Array#shift.

hash = {"Joe Smith"=>{}}

array = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarray = [:email, :address, :phone]

hash.each do |key, value|
  value[labelarray.shift] = array.shift
  value[labelarray.shift] = array.shift
  value[labelarray.shift] = array.shift
end

p hash

puts "----"

# I think I finally figured this out...

hashabc = {"Joe Smith"=>{}}

arrayabc = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarrayabc = [:email, :address, :phone]

hashabc.each do |key, _| # _ since we don't use 'value'
  labelarrayabc.each do |element|
    hashabc[key][element] = arrayabc.shift
  end
end

p hashabc

puts "----"

# Can also do...

hashabc = {"Joe Smith"=>{}}

arrayabc = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarrayabc = [:email, :address, :phone]

hashabc.each do |_, value|
  labelarrayabc.each do |element|
    value[element] = arrayabc.shift
  end
end

p hashabc
