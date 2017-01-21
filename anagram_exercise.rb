array = ['demo', 'none', 'tied', 'evil', 'dome','mode','live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']
hash = {}

array.each do |element|
  key = element.chars.sort.join # Can also do element.split(//).sort.join
  if hash.has_key?(key)
    hash[key].push(element) # Can also do hash[key]<<element
  else
    hash[key] = [element]
  end
end

# Block above POPULATES the hash

hash.each do |key, value|
  p value
end
