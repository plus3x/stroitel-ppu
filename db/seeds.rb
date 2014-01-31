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
  { id: 1, role_id: 1, name: 'admin',   password: 'PasswordAdmina',   password_confirmation: 'PasswordAdmina'   },
  { id: 2, role_id: 2, name: 'manager', password: 'PasswordManagera', password_confirmation: 'PasswordManagera' }
])
if users[0].save and users[1].save
  puts "Default users: " + users.map(&:name).join(', ')
else
  puts '>>> User not created!'
end

Service.destroy_all
services = [
  { id: 1, 
	name: 'Трубы ППУ',        
	title: 'Трубы ППУ от производителя', 
	picture_url: nil, 
	description: open('db/descriptions/services/pipes.html').read },
  { id: 2, 
	name: 'Фасонные изделия', 
	title: 'Фасонные изделия',           
	picture_url: nil, 
	description: open('db/descriptions/services/formed-parts.html').read },
  { id: 3, 
	name: 'Элементы теплотрасс',      
	title: 'Элементы теплотрасс',              
	picture_url: nil, 
	description: open('db/descriptions/services/heating_mains.html').read },
  { id: 4, 
	name: 'Строительство и реконструкция инженерных сетей',      
	title: 'Строительство и реконструкция наружных инженерных сетей (канализация, тепловые сети, водопровод)',              
	picture_url: nil, 
	description: open('db/descriptions/services/external_utilities.html').read },
  { id: 5, 
	name: 'Винтовые сваи',      
	title: 'Изготовление и монтаж стальных винтовых свай (любой длины и диаметра для строительства дачных домой и коттеджей)',              
	picture_url: nil, 
	description: open('db/descriptions/services/screw_piles.html').read },
  { id: 6, 
	name: 'Фильтр-патрон',      
	title: 'Изготовление фильтр-патронов для очистки сточных вод',              
	picture_url: nil, 
	description: open('db/descriptions/services/filter.html').read },
  { id: 7, 
	name: 'Изготовление качелей',      
	title: 'Изготовление качелей (по индивидуальным заказам или готовые усиленной подъемности)',              
	picture_url: nil, 
	description: open('db/descriptions/services/seesaw.html').read },
  { id: 8, 
	name: 'Производство бытовок',      
	title: 'Производство бытовок',              
	picture_url: nil, 
	description: open('db/descriptions/services/seesaw.html').read }
]

print "Default services: "
Service.create(services).each do |item|
  if item.save
    print "#{item.id}, "
  else
    puts '>>> Service list not created!'
  end
end
print "\n"

TypeOfProduct.destroy_all
type_of_products = [
  { id: 1, name: 'Отводы в ППУ изоляции', 		title: 'Отводы в ППУ изоляции', picture_url: nil, service_id: 2,
		description: open('db/descriptions/type_of_products/taps_in_foam_insulation.html').read },
  { id: 2, name: 'Тройники в ППУ изоляции', 		title: 'Тройники в ППУ изоляции', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/tees.html').read },
  { id: 3, name: 'Тройниковые ответвления', 		title: 'Тройниковые ответвления', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/tee_branch.html').read },
  { id: 4, name: 'Тройники параллельные', 			title: 'Тройники параллельные', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/tee_parallel.html').read },
  { id: 5, name: 'Z-образные элементы', 			title: 'Z-образные элементы', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/z-type.html').read },
  { id: 6, name: 'Каналы непроходные', 			title: 'Каналы непроходные', picture_url: nil, service_id: 3, 
		description: open('db/descriptions/type_of_products/impassable_channels.html').read },
  { id: 7, name: 'Опорные подушки', 			title: 'Опорные подушки', picture_url: nil, service_id: 3, 
		description: open('db/descriptions/type_of_products/opornie-podushki.html').read },
  { id: 8, name: 'Тепловые камеры', 			title: 'Тепловые камеры', picture_url: nil, service_id: 3, 
		description: open('db/descriptions/type_of_products/thermal_cameras.html').read },
  { id: 9, name: 'Ж/б кольца для колодцев', 			title: 'Железо/бетонные кольца для колодцев', picture_url: nil, service_id: 3, 
		description: open('db/descriptions/type_of_products/rings-for-wells.html').read }
]

print "Default TypeOfProducts: "
TypeOfProduct.create(type_of_products).each do |item|
  if item.save
    print "#{item.id}, "
  else
    puts '>>> TypeOfProduct list not created!'
  end
end
print "\n"


Product.destroy_all
products = [
  { id: 1, 
	name: 'Отводы в ППУ изоляции в оболочке из пэ',          
	title: 'Отводы в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',          
	picture_url: nil, 
	type_of_product_id: 1, 
	description: open('db/descriptions/products/taps_in_foam_insulation_pe.html').read },
  { id: 2, 
	name: 'Отводы в ППУ изоляции в оболочке из оц',   
	title: 'Отводы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',   
	picture_url: nil, 
	type_of_product_id: 1, 
	description: open('db/descriptions/products/taps_in_foam_insulation_oc.html').read },
  { id: 3, 
	name: 'Двойные отводы',                                           
	title: 'Двойные отводы | ПСФ Строитель',                                           
	picture_url: nil, 
	type_of_product_id: 1, 
	description: open('db/descriptions/products/taps_in_foam_insulation_double.html').read },
  { id: 4, 
	name: 'Тройники в ППУ изоляции в оболочке из пэ',        
	title: 'Тройники в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',        
	picture_url: nil, 
	type_of_product_id: 2, 
	description: open('db/descriptions/products/tees_pe.html').read },
  { id: 5, 
	name: 'Тройники в ППУ изоляции в оболочке из оц', 
	title: 'Тройники в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель', 
	picture_url: nil, 
	type_of_product_id: 2, 
	description: open('db/descriptions/products/tees_oc.html').read },
  { id: 6, 
	name: 'Двойные тройники',                                         
	title: 'Двойные тройники | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 2, 
	description: open('db/descriptions/products/tees_double.html').read },
  { id: 7, 
	name: 'Тройниковые ответвления в ППУ изоляции в оболочке из пэ',                                         
	title: 'Тройниковые ответвления в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 3, 
	description: open('db/descriptions/products/tee_branch_pe.html').read },
  { id: 8, 
	name: 'Тройниковые ответвления в ППУ изоляции в оболочке из оц',                                         
	title: 'Тройниковые ответвления в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 3, 
	description: open('db/descriptions/products/tee_branch_oc.html').read },
  { id: 9, 
	name: 'Тройники параллельные в ППУ изоляции в оболочке из пэ',                                         
	title: 'Тройники параллельные в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 4, 
	description: open('db/descriptions/products/tee_parallel_pe.html').read },
  { id: 10, 
	name: 'Тройники параллельные в ППУ изоляции в оболочке из оц',                                         
	title: 'Тройники параллельные в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 4, 
	description: open('db/descriptions/products/tee_parallel_oc.html').read },
  { id: 11, 
	name: 'Z-образные элементы в ППУ изоляции в оболочке из пэ',                                         
	title: 'Z-образные элементы в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 5, 
	description: open('db/descriptions/products/z-type_pe.html').read },
  { id: 12, 
	name: 'Z-образные элементы в ППУ изоляции в оболочке из оц',                                         
	title: 'Z-образные элементы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 5, 
	description: open('db/descriptions/products/z-type_oc.html').read }
]
print "Default products: "
Product.create(products).each do |product|
  if product.save
    print "#{product.id}, "
  else
    puts '>>> Product list not created!'
  end
end
print "\n"

SeoMeta.destroy_all
seometa = [
  { id: 1, 	keywords: 'Трубы ППУ от производителя',         	description: 'Трубы ППУ от производителя', service_id: 1 },
  { id: 2, 	keywords: 'Фасонные изделия',         				description: 'Фасонные изделия', service_id: 2 },
  { id: 3, 	keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 3 },
  { id: 4, 	keywords: 'Отводы в ППУ изоляции', 					description: 'Type of product meta description', type_of_product_id: 1 },
  { id: 5, 	keywords: 'Тройники в ППУ изоляции', 				description: 'Type of product meta description', type_of_product_id: 2 },
  { id: 6, 	keywords: 'Тройниковые ответвления', 				description: 'Type of product meta description', type_of_product_id: 3 },
  { id: 7, 	keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 4 },
  { id: 8,	keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 5 },
  { id: 9, 	keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 6 },
  { id: 10, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 7 },
  { id: 11, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 8 },
  { id: 12, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 9 },
  { id: 13, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 10 },
  { id: 14, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 1 },
  { id: 15, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 2 },
  { id: 16, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 3 },
  { id: 17, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 4 },
  { id: 18, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 5 },
  { id: 19, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 6 },
  { id: 20, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 7 },
  { id: 21, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 8 },
  { id: 22, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 9 },
  { id: 23, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 10 },
  { id: 24, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 11 },
  { id: 25, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 12 },
  { id: 26, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 13 },
  { id: 27, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 14 },
  { id: 28, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 15 },
  { id: 29, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 16 },
  { id: 30, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 4 },
  { id: 31, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 5 },
  { id: 32, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 6 },
  { id: 33, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 7 },
  { id: 34, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 8 },
  { id: 35, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 9 },
]
print "Default seo meta: "
SeoMeta.create(seometa).each do |seo_meta|
  if seo_meta.save
    print "#{seo_meta.id}, "
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
