# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

Product.delete_all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'products-hooverscards.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  p = Product.new
  # Extracting integer from SKU column
  sku_text = row['SKU']
  sku_integer = sku_text.scan(/\d+/).join.to_i

  p.product_id = "#{row['PRODUCT ID']}#{sku_integer}" # Concatenating PRODUCT ID and SKU
  p.title = row['TITLE']
  p.image = row['IMAGE']
  p.category = row['CATEGORY']
  p.type = row['OPTION1 VALUE']
  p.price = row['sale_date']
  p.sale_price = row['price']
  p.inventory = row['INVENTORY']
  p.save
  puts "#{p.product_id} saved"
end

puts "There are now #{Product.count} rows in the products table."
