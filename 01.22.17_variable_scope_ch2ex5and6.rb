# Look at the following programs...

=begin

x = 0

3.times do
  x += 1
end

puts x (Will output 3, because 0, increasing in increments
[+=] of 1 three times, equals 3)

=end

# and

y = 0

3.times do
  y += 1
  x = y
end

puts x # Outputs error message, because `x` is initiated in
# the INNER SCOPE (inside the do/end block) and is being
# called on by the OUTER SCOPE. *Inner scope can access
# variables initialized in an outer scope, but not vice versa.

=begin What does x print to the screen in each case? Do they
both give errors? Are the errors different? Why?
=end
