# Write a Ruby program to create a class called "Inventory" with a collection of products and methods
# to add and remove products, and to check for low inventory.
class Inventory
  attr_accessor :inventory_name, :products

  def initialize(inventory_name)
    @inventory_name = inventory_name
    @products = []
  end

  def add_product(product)
    find_product = @products.find { |search_product_by_id| product.product_id == search_product_by_id.product_id}
    if find_product
      puts "it's already exist. You should increase the Quantity."
    else
      @products << product
      puts "product #{product.product_name} was added"
    end
  end

  def remove_product(product_id)
    find_product = @products.find {|search_product_by_id| product_id == search_product_by_id.product_id}
    if find_product
      @products.delete(find_product)
      puts "Product #{find_product.product_name} with product id #{product_id} Was removed."
    else
      puts "we don't have any products with this id #{product_id}"
    end
  end

  def add_quantity_to_product(product_id, product_quantity)
    find_product = @products.find {|product| product.product_id == product_id}
    if find_product
      find_product.product_quantity += product_quantity
      puts "the new quantity for product #{find_product.product_name} is: #{find_product.product_quantity}"
    else
      puts "The Product is not exist."
    end
  end

  def remove_quantity_to_product(product_id, product_quantity)
    find_product = @products.find {|product| product.product_id == product_id}
    if find_product
      find_product.product_quantity -= product_quantity
      puts "the new quantity #{find_product.product_name} is: #{find_product.product_quantity}"
    else
      puts "The Product is not exist."
    end
  end

  def show_all_products
    puts "All Products in #{@inventory_name} branch."
    @products.each do |product|
      puts "- #{product.product_name}"
    end
  end

end


class Product
  attr_accessor :product_id, :product_name, :product_quantity

  def initialize(product_id, product_name, product_quantity)
    @product_id = product_id
    @product_name = product_name
    @product_quantity = product_quantity
  end

end

# Open Branches
mansoura = Inventory.new("Mansoura")
alexandria = Inventory.new("Alexandria")
cairo = Inventory.new("cairo")

# Add Products
shepshep = Product.new(11, "shepshep", 30)
shoes = Product.new(12, "shoes", 300)
kotch = Product.new(13, "kotch", 3000)

# Add Products to Branch
mansoura.add_product(shepshep)
mansoura.add_product(shoes)
mansoura.add_product(kotch)
puts "--" * 50

# Remove Products
mansoura.remove_product(11)
puts "--" * 50

# Add Quantity
mansoura.add_quantity_to_product(12, 300)
puts "--" * 50

# remove Quantity
mansoura.add_quantity_to_product(13, 1)
puts "--" * 50

mansoura.show_all_products