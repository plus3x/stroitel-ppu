# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.destroy_all
roles = Role.create([ 
  {id: 1, title: "admin"},
  {id: 2, title: "manager"}
])
if roles[0].save and roles[1].save
  puts "Default roles: " + roles.map(&:title).join(', ')
else
  puts '>>> Roles not created!'
end

User.destroy_all
users = User.create([
  { id: 1, role_id: 1, name: 'admin',   password: 'admin',   password_confirmation: 'admin'   },
  { id: 2, role_id: 2, name: 'manager', password: 'manager', password_confirmation: 'manager' }
])
if users[0].save and users[1].save
  puts "Default users: " + users.map(&:name).join(', ')
else
  puts '>>> User not created!'
end

Service.destroy_all
services = Service.create([
  { id: 1, name: 'New service', title: 'Service title', description: 'Service description', picture_url: nil },
  { id: 2, name: 'New service', title: 'Service title', description: 'Service description', picture_url: nil },
  { id: 3, name: 'New service', title: 'Service title', description: 'Service description', picture_url: nil }
])
if services[0].save and services[1].save and services[2].save
  puts "Default services: " + services.map(&:name).join(', ')
else
  puts '>>> Service list not created!'
end

TypeOfProduct.destroy_all
type_of_products = TypeOfProduct.create([
  { id: 1, name: 'New type of product', title: 'Type of product title', description: 'Type of product description', picture_url: nil, service_id: 1 },
  { id: 2, name: 'New type of product', title: 'Type of product title', description: 'Type of product description', picture_url: nil, service_id: 2 },
  { id: 3, name: 'New type of product', title: 'Type of product title', description: 'Type of product description', picture_url: nil, service_id: 3 }
])
if type_of_products[0].save and type_of_products[1].save and type_of_products[2].save
  puts "Default type of products: " + type_of_products.map(&:name).join(', ')
else
  puts '>>> Type of product list not created!'
end

Product.destroy_all
products = Product.create([
  { id: 1, name: 'New product', title: 'Product title', description: 'Product description', picture_url: nil, type_of_product_id: 1 },
  { id: 2, name: 'New product', title: 'Product title', description: 'Product description', picture_url: nil, type_of_product_id: 2 },
  { id: 3, name: 'New product', title: 'Product title', description: 'Product description', picture_url: nil, type_of_product_id: 3 }
])
if products[0].save and products[1].save and products[2].save
  puts "Default products: " + products.map(&:name).join(', ')
else
  puts '>>> Product list not created!'
end

SeoMeta.destroy_all
seometa = [
  { id: 1, keywords: 'Service meta key words',         description: 'Service meta description', service_id: 1 },
  { id: 2, keywords: 'Service meta key words',         description: 'Service meta description', service_id: 2 },
  { id: 3, keywords: 'Service meta key words',         description: 'Service meta description', service_id: 3 },
  { id: 4, keywords: 'Type of product meta key words', description: 'Type of product meta description', type_of_product_id: 1 },
  { id: 5, keywords: 'Type of product meta key words', description: 'Type of product meta description', type_of_product_id: 2 },
  { id: 6, keywords: 'Type of product meta key words', description: 'Type of product meta description', type_of_product_id: 3 },
  { id: 7, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 1 },
  { id: 8, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 2 },
  { id: 9, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 3 }
]
print "Default seo meta: "
SeoMeta.create(seometa).each do |seo_meta|
  if seo_meta.save
    print seo_meta.id
  else
    puts '>>> Seo meta not created!'
  end
end
print "\n"

Order.destroy_all
orders = Order.create([
  { id: 1, email: 'user@user.com', description: 'Order description' },
  { id: 2, email: 'user@user.com', description: 'Order description' },
  { id: 3, email: 'user@user.com', description: 'Order description' }
])
if orders[0].save and orders[1].save and orders[2].save
  puts "Default orders: " + orders.map(&:email).join(', ')
else
  puts '>>> Order list not created!'
end