# Define module for managing inventories
module InventoryManagement
  def add_product(product)
    raise NotImplementedError, "This method should be implemented in a subclass"
  end

  def remove_product(product_id)
    raise NotImplementedError, "This method should be implemented in a subclass"
  end
end

# Class for Product
class Product
  attr_accessor :product_id, :product_name, :product_quantity

  def initialize(product_id, product_name, product_quantity)
    @product_id = product_id
    @product_name = product_name
    @product_quantity = product_quantity
  end
end

# Manager class for handling product-related tasks
class ProductManager
  def initialize
    @products = []
  end

  def add_product(product)
    if @products.any? { |p| p.product_id == product.product_id }
      puts "Product #{product.product_name} already exists."
    else
      @products << product
      puts "Product #{product.product_name} was added."
    end
  end

  def remove_product(product_id)
    product = @products.find { |p| p.product_id == product_id }
    if product
      @products.delete(product)
      puts "Product #{product.product_name} removed."
    else
      puts "Product with ID #{product_id} not found."
    end
  end

  def find_product(product_id)
    @products.find { |p| p.product_id == product_id }
  end

  def all_products
    @products
  end
end

# Class for managing product quantities
class QuantityManager
  def add_quantity(product, quantity)
    product.product_quantity += quantity
    puts "New quantity for #{product.product_name} is #{product.product_quantity}."
  end

  def remove_quantity(product, quantity)
    if product.product_quantity >= quantity
      product.product_quantity -= quantity
      puts "New quantity for #{product.product_name} is #{product.product_quantity}."
    else
      puts "Not enough stock for #{product.product_name}."
    end
  end

  def low_stock?(product, threshold = 10)
    product.product_quantity < threshold
  end
end

# Main Inventory class, using SRP and DIP
class Inventory
  include InventoryManagement

  def initialize(name)
    @name = name
    @product_manager = ProductManager.new
    @quantity_manager = QuantityManager.new
  end

  def add_product(product)
    @product_manager.add_product(product)
  end

  def remove_product(product_id)
    @product_manager.remove_product(product_id)
  end

  def add_quantity(product_id, quantity)
    product = @product_manager.find_product(product_id)
    if product
      @quantity_manager.add_quantity(product, quantity)
    else
      puts "Product not found."
    end
  end

  def remove_quantity(product_id, quantity)
    product = @product_manager.find_product(product_id)
    if product
      @quantity_manager.remove_quantity(product, quantity)
    else
      puts "Product not found."
    end
  end

  def show_all_products
    puts "Products in #{@name}:"
    @product_manager.all_products.each do |product|
      puts "- #{product.product_name}: #{product.product_quantity} in stock."
    end
  end

  def check_low_stock(product_id, threshold = 10)
    product = @product_manager.find_product(product_id)
    if product
      if @quantity_manager.low_stock?(product, threshold)
        puts "#{product.product_name} is running low on stock!"
      else
        puts "#{product.product_name} has sufficient stock."
      end
    else
      puts "Product not found."
    end
  end

end

# Usage example
inventory = Inventory.new("Main Warehouse")

product1 = Product.new(1, "Laptop", 50)
product2 = Product.new(2, "Smartphone", 5)

inventory.add_product(product1)
inventory.add_product(product2)

inventory.show_all_products

inventory.add_quantity(1, 20)
inventory.remove_quantity(2, 3)

inventory.check_low_stock(2)
