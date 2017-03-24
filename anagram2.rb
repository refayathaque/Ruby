array = ['demo', 'none', 'tied', 'evil', 'dome','mode','live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']
hash = {}

array.each do |element|
  key = element.split('').sort.join
  if hash.has_key?(key)
    hash[key].push(element)
  else
    hash[key] = [element]
  end
end

hash.each do |_, value|
  p value
end
