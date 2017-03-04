def space_out_letters(person)
  return person.chars.join(" ")
end

def greet(person)
  return "H e l l o, " + space_out_letters(person)
end

def decorate_greeting(person)
  puts greet(person)
end

decorate_greeting("John")
