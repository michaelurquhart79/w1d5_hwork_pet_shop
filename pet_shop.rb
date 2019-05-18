def pet_shop_name(pet_shop)
  return pet_shop[:name]
end

def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop,cash)
  pet_shop[:admin][:total_cash] += cash
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, additional_pets_sold)
  pet_shop[:admin][:pets_sold] += additional_pets_sold
  # pets_sold(pet_shop) += additional_pets_sold
  # I thought the above commented-out line would work but it doesn't
end

def stock_count(pet_shop)
  return pet_shop[:pets].count
end

def pets_by_breed(pet_shop, breed)
  full_pet_array = pet_shop[:pets]
  pet_array_by_breed = []

  for each_pet in full_pet_array
    if (each_pet[:breed] == breed)
      pet_array_by_breed.push(each_pet)
    end
  end

  return pet_array_by_breed

end

def find_pet_by_name(pet_shop, pet_name)
  full_pet_array = pet_shop[:pets]
  for each_pet in full_pet_array
    if (each_pet[:name] == pet_name)
      return each_pet
    end
  end
  return
end

def remove_pet_by_name(pet_shop, pet_name)
  full_pet_array = pet_shop[:pets]
  full_pet_array.delete_if {|pet| pet[:name] == pet_name}
end

def add_pet_to_stock(pet_shop, new_pet)
  full_pet_array = pet_shop[:pets]
  full_pet_array.push(new_pet)
end

def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash)
  customer[:cash] -= cash
end

def customer_pet_count(a_customer)
  a_customer[:pets].length
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets].push(new_pet)
end

def customer_can_afford_pet(customer, new_pet)
  if (customer[:cash] >= new_pet[:price])
    return true
  else
    return false
  end
end

def sell_pet_to_customer(pet_shop, pet, customer)

  if ( (pet != nil) && (customer_can_afford_pet(customer, pet)) )
    # get cost of pet
    pet_cost = pet[:price]

    # remove cash from customer
    remove_customer_cash(customer, pet_cost)

    # add cash to pet_shop
    add_or_remove_cash(pet_shop, pet_cost)

    # remove pet from pet_shop
    remove_pet_by_name(pet_shop, pet[:name])

    # add pet to customer
    add_pet_to_customer(customer, pet)

    # increase pets sold by 1
    increase_pets_sold(pet_shop, 1)
  end


end
