=begin A variable's scope determines where in a program
the varible can be used. The scope is defined by where the
variable is created. In Ruby, the scope is defined by a
block (code following a method invocation [not method
definition], and delimited by either {} or do/end).
***Inner scope can access variables created in the outer
scope, but not vice versa (outer scope cannot access
variables created in the inner scope).
=end

# Example of Inner Scope accessing variables created in
# the Outer Scope

array = [1, 2, 3, 4, 5]
multiplier = 2

array.each do |element|
  puts element * multiplier # 'Multiplier' variable is
  # above, in the Outer Scope
end

# Will output '2, 4, 6, 8, 10'

puts "----"

# Example of Outer Scope accessing variables created in
# the Inner Scope

array = [1, 2, 3, 4, 5]

array.each do |element|
  multiplier = 2
  puts element * multiplier
end

# Will output '2, 4, 6, 8, 10'

puts mutiplier # Won't output '2' because this is in the
# Outer Scope, and it's trying to access the variable
# 'multiplier' which was created in the Inner Scope,
# or inside the block
