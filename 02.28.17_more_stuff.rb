=begin
This document will cover some topics that are important to know, but not
necessary on our path to learn Ruby. We will just cover the basics of these
topics.
=end

=begin
REGEX (Regular Expression) - A sequence of characters that form pattern
matching rules, and is then applied to a string to look for matches.

Creating REGEX starts with / and ends with /, inside /../ we can place
any charaacters we want to match with the string. We use the =~ operator
to see if we have a match in our REGEX.

Let's say we're looking for the letter 'b' in the string 'powerball', we
want to see where in the string it is (we're looking for the index number).

[1] pry(main)> "powerball" =~ /b/
=> 5

We can also use the =~ operator as a boolean to check for matches, let's
try this in a method example below.
=end

def doesthestringhavea_s_or_t(string)
  if string =~ /s/
    string.capitalize!
    puts "'#{string}' has a 's', there is a match!"
  elsif string =~ /t/
      string.capitalize!
      puts "'#{string}' has a 't', there is a match!"
  else
    string.capitalize!
    puts "'#{string}' does NOT have a 's' or 't', no match here."
  end
end

doesthestringhavea_s_or_t("salmon") # Match
doesthestringhavea_s_or_t("halibut") # Match
doesthestringhavea_s_or_t("cod") # No match
doesthestringhavea_s_or_t("tilapia") # Match

=begin
In addition to the =~ operator we can also use the String#match method to
do REGEX comparisons. This method returns a `MatchData` object that
describes the match or `nil` if there is not match.

[1] pry(main)> /s/.match("mississippi")
=> #<MatchData "s">

We can also use String#match as a boolean, let's use it in our example
above.
=end

def doesthestringhavea_s_or_t(string)
  if /s/.match(string)
    string.capitalize!
    puts "'#{string}' has a 's', there is a match!"
  elsif /t/.match(string)
      string.capitalize!
      puts "'#{string}' has a 't', there is a match!"
  else
    string.capitalize!
    puts "'#{string}' does NOT have a 's' or 't', no match here."
  end
end

doesthestringhavea_s_or_t("salmon")
doesthestringhavea_s_or_t("halibut")
doesthestringhavea_s_or_t("cod")
doesthestringhavea_s_or_t("tilapia")

=begin
Whenever we encounter a string pattern matching problem, we must remember
to look into using REGEX.
=end

# RUBY STANDARD CLASSES
