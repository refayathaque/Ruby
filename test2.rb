hashabc = {"Joe Smith"=>{}}

arrayabc = ["joe@email.com", "123 Main st.", "555-123-4567"]

labelarrayabc = [:email, :address, :phone]

hashabc.each do |key, value|
  labelarrayabc.each do |element|
    hashabc["Joe Smith"][element] = arrayabc.shift
  end
end

p hashabc
