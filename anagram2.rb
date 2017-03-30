array = ['demo', 'none', 'tied', 'evil', 'dome','mode','live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']
hash = Hash.new

array.map do |element|
  key = element.split('').sort.join
  if hash.has_key?(key)
    hash[key] << element
  else
    hash[key] = [element]
  end
end

hash.each do |_, value|
  p value
end
