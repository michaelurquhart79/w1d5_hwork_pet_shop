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
