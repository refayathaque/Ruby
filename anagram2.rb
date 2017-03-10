array = ['demo', 'none', 'tied', 'evil', 'dome','mode','live',
  'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
  'flow', 'neon']
hash = {}

array.each do |element|
  key = element.split('').sort.join
  if hash.has_key?(key)
    hash[key] << element # Inserting into ARRAY, NOT HASH
  else
    hash[key] = [element] # ARRAY is being created here, so ^ will work
  end
end

hash.each do |key, value|
  p value
end
