contact_datab = ["joe@email.com", "123 Main st.", "555-123-4567"]

contactsb = {"Joe Smith" => {}}

contact_datab.each do |element|
  if contact_datab[0] == element
    contactsb["Joe Smith"][:email] = element
  elsif contact_datab[1] == element
    contactsb["Joe Smith"][:address] = element
  else
    contactsb["Joe Smith"][:phone] = element
  end
end

p contactsb
