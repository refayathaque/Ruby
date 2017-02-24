=begin
1. Given a hash of family members, with keys as the title and an array of names
as the values, use Ruby's built-in select method to gather only immediate
family members' names into a new array.
=end

family = {  uncles: ["bob", "joe", "steve"],
            sisters: ["jane", "jill", "beth"],
            brothers: ["frank","rob","david"],
            aunts: ["mary","sally","susan"]
          }

family.select! { |key, value| key == :sisters || key == :brothers }
p family.values.flatten

puts "----"

# Above we used Hash#select!, but the instructions told us to use Hash#select.

# Using Hash#select

immediatefamily = family.select { |key, value| key == :sisters || key == :brothers }
p immediatefamily.values.flatten

puts "----"

=begin
2. Look at Ruby's merge method. Notice it has two versions. What is the
difference between Hash#merge and Hash#merge! ? Write a program that uses both
and illustrate the differences.
=end

# Hash#merge does NOT mutate the caller (leaves original hash unmodified)
# Hash#merge! mutates the caller (modifies original hash)

hash1 = {a: 100, b: 200}
hash2 = {b: 250, c: 300}

p hash1.merge(hash2) # {:a=>100, :b=>250, :c=>300}
p hash1 # hash1 unmodified {:a=>100, :b=>200}

# *** Important to note that if no block is specfied, the value for entries
# with duplicate keys will be that of the other_hash (hash2 in our case). This
# is why the merge method returned :b=>250 (hash2) instead of :b=>200 (hash1).

puts "----"

p hash1.merge!(hash2) # {:a=>100, :b=>250, :c=>300}
p hash1 # hash1 modified {:a=>100, :b=>250, :c=>300}

# Same thing here, if no block is specified, entries with duplicate keys are
# overwritten with the values from the other_hash (hash2 in our case).

puts "----"
