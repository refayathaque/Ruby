hash = {"Joe Smith"=>{}}

array = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarray = [:email, :address, :phone]

hash.each do |key, value|
  value = labelarray.shift
  hash["Joe Smith"][value] = array.first
end

p hash
