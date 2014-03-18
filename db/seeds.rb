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
	name: 'Комплекты заделки стыков',      
	title: 'Комплекты заделки стыков',              
	picture_url: nil, 
	description: open('db/descriptions/services/sealing_joints.html').read },
  { id: 5, 
	name: 'Строительство и реконструкция инженерных сетей',      
	title: 'Строительство и реконструкция наружных инженерных сетей (канализация, тепловые сети, водопровод)',              
	picture_url: nil, 
	description: open('db/descriptions/services/external_utilities.html').read },
  { id: 6, 
	name: 'Винтовые сваи',      
	title: 'Изготовление и монтаж стальных винтовых свай (любой длины и диаметра для строительства дачных домой и коттеджей)',              
	picture_url: nil, 
	description: open('db/descriptions/services/screw_piles.html').read },
  { id: 7, 
	name: 'Фильтр-патрон ФИПОС',      
	title: 'Изготовление фильтр-патронов для очистки сточных вод',              
	picture_url: nil, 
	description: open('db/descriptions/services/filter.html').read },
  { id: 8, 
	name: 'Изготовление качелей',      
	title: 'Изготовление качелей (по индивидуальным заказам или готовые усиленной подъемности)',              
	picture_url: nil, 
	description: open('db/descriptions/services/seesaw.html').read },
  { id: 9, 
	name: 'Производство бытовок',      
	title: 'Производство бытовок',              
	picture_url: nil, 
	description: open('db/descriptions/services/huts.html').read },
  { id: 10, 
	name: 'Футеровка пластиком внутренней поверхности железобетонных колодцев',      
	title: 'Футеровка пластиком внутренней поверхности железобетонных колодцев',              
	picture_url: nil, 
	description: open('db/descriptions/services/foterovka.html').read }
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
		description: open('db/descriptions/type_of_products/rings-for-wells.html').read },
  { id: 10, name: 'Скорлупа ППУ для изоляции труб',	title: 'Скорлупа ППУ для изоляции труб', picture_url: nil, service_id: 4, 
		description: open('db/descriptions/type_of_products/shell.html').read },
  { id: 11, name: 'Лента термоусаживаемая', 			title: 'Лента термоусаживаемая', picture_url: nil, service_id: 4, 
		description: open('db/descriptions/type_of_products/termo_lenta.html').read },
  { id: 12, name: 'Термоусаживающаяся муфта', 			title: 'Термоусаживающаяся муфта', picture_url: nil, service_id: 4, 
		description: open('db/descriptions/type_of_products/sleeve.html').read },
  { id: 13, name: 'Пенопакет', 			title: 'Пенопакет', picture_url: nil, service_id: 4, 
		description: open('db/descriptions/type_of_products/packet.html').read },
  { id: 14, name: 'Переходы', 			title: 'Переходы', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/transitions.html').read },
  { id: 15, name: 'Cильфонный компенсатор', 			title: 'Cильфонный компенсатор', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/compensator.html').read },
  { id: 16, name: 'Скользящие опоры', 			title: 'Скользящие опоры', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/skolizyaschie_opory.html').read },
  { id: 17, name: 'Неподвижные щитовые опоры', 			title: 'Неподвижные щитовые опоры', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/fixed-ppu.html').read },
  { id: 18, name: 'Концевые элементы', 			title: 'Концевые элементы', picture_url: nil, service_id: 2, 
		description: open('db/descriptions/type_of_products/koncevye_elementy.html').read }
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
	name: 'Z-образные элементы из пэ',                                         
	title: 'Z-образные элементы в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 5, 
	description: open('db/descriptions/products/z-type_pe.html').read },
  { id: 12, 
	name: 'Z-образные элементы из оц',                                         
	title: 'Z-образные элементы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 5, 
	description: open('db/descriptions/products/z-type_oc.html').read },
  { id: 13, 
	name: 'Переходы стальные в ППУ изоляции в оболочке из пэ',                                         
	title: 'Переходы стальные в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 14, 
	description: open('db/descriptions/products/transitions_pe.html').read },
  { id: 14, 
	name: 'Переходы в ППУ изоляции в оболочке из оц',                                         
	title: 'Переходы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 14, 
	description: open('db/descriptions/products/transitions_oc.html').read },
  { id: 15, 
	name: 'Переходные элементы',                                         
	title: 'Переходные элементы для стыковки изделий с обычными трубопроводами | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 14, 
	description: open('db/descriptions/products/transitions_ather.html').read },
  { id: 16, 
	name: 'Компенсатор сильфонный фланцевый',                                         
	title: 'Компенсатор сильфонный фланцевый | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 15, 
	description: open('db/descriptions/products/compensator_fl.html').read },
  { id: 17, 
	name: 'Осевой сильфонный компенсатор',                                         
	title: 'Осевой сильфонный компенсатор | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 15, 
	description: open('db/descriptions/products/compensator_os.html').read },
  { id: 18, 
	name: 'Компенсаторы сильфонные универсальные',                                         
	title: 'Компенсаторы сильфонные универсальные | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 15, 
	description: open('db/descriptions/products/compensator_un.html').read },
  { id: 19, 
	name: 'Опора скользящая хомутовая',                                         
	title: 'Опора скользящая хомутовая | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 16, 
	description: open('db/descriptions/products/skolizyaschie_opory_hom.html').read },
  { id: 20, 
	name: 'Опора скользящая приварная',                                         
	title: 'Опора скользящая приварная | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 16, 
	description: open('db/descriptions/products/skolizyaschie_opory_pr.html').read },
  { id: 21, 
	name: 'Опора скользящая ТС',                                         
	title: 'Опора скользящая ТС | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 16, 
	description: open('db/descriptions/products/skolizyaschie_opory_tc.html').read },
  { id: 22, 
	name: 'Z-образные элементы в ППУ изоляции в оболочке из оц',                                         
	title: 'Z-образные элементы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
	picture_url: nil, 
	type_of_product_id: 17, 
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

Debtor.destroy_all
debtors = [
  { id: 1,      
	title: 'Должники', 
	content: open('db/descriptions/debtors/debtors.html').read }
]
print "Default debtors: "
Debtor.create(debtors).each do |debtor|
  if debtor.save
    print "#{debtor.id}, "
  else
    puts '>>> Debtor list not created!'
  end
end
print "\n"

SeoMeta.destroy_all
seometa = [

  { id: 1, 	keywords: 'отводы +в ппу изоляции, вес отводов +в ппу изоляции, отвод стальной +в изоляции ппу', 					description: 'Отводы в ППУ изоляции', type_of_product_id: 1 },
  { id: 2, 	keywords: 'тройник +в ппу изоляции, тройник +в ппу', 				description: 'Тройники в ППУ изоляции', type_of_product_id: 2 },
  { id: 3, 	keywords: 'Тройниковые ответвления, тройниковое ответвление +в ппу, тройниковые ответвления +в оц', 				description: 'Тройниковые ответвления', type_of_product_id: 3 },
  { id: 4, 	keywords: 'Тройники параллельные,тройник параллельный', 		description: 'Тройник параллельный', type_of_product_id: 4 },
  { id: 5,	keywords: 'Z-образные элементы, z образный элемент', 		description: 'Z-образные элементы', type_of_product_id: 5 },
  { id: 6, 	keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 6 },
  { id: 7, keywords: 'Опорные подушки ппу,опорная подушка, оп ппу', 		description: 'Опорные подушки', type_of_product_id: 7 },
  { id: 8, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 8 },
  { id: 9, keywords: 'Железо/бетонные кольца, кольца, жб кольца, ж/б кольца', 		description: 'Железо/бетонные кольца для колодцев', type_of_product_id: 9 },
  { id: 10, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 10 },
  { id: 11, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 11 },
  { id: 12, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 12 },
  { id: 13, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 13 },
  { id: 14, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 14 },
  { id: 15, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 15 },
  { id: 16, keywords: 'Скользящие опоры, опора под скользящую опору,изготовление скользящих опор,скользящие +и неподвижные опоры,	скользящие опоры ппу', 		description: 'Скользящие опоры', type_of_product_id: 16 },
  { id: 17, keywords: 'Неподвижные щитовые опоры, НЩО, опора неподвижная щитовая, неподвижные щитовые опоры +для трубопроводов, неподвижная щитовая опора ппу', 		description: 'Неподвижные щитовые опоры', type_of_product_id: 17 },
  { id: 18, keywords: 'Концевые элементы,концевые элементы ппу,концевой элемент трубопровода,концевой элемент', 		description: 'Концевые элементы', type_of_product_id: 18 },
  { id: 19, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 19 },
  { id: 20, keywords: 'Type of product meta key words', 		description: 'Type of product meta description', type_of_product_id: 20 },
 
  { id: 21, keywords: 'Product meta key words',         description: 'Product meta descRCJription', product_id: 1 },
  { id: 22, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 2 },
  { id: 23, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 3 },
  { id: 24, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 4 },
  { id: 25, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 5 },
  { id: 26, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 6 },
  { id: 27, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 7 },
  { id: 28, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 8 },
  { id: 29, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 9 },
  { id: 30, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 10 },
  { id: 31, keywords: 'z образные элементы, z образный элемент',         description: 'Z-образные элементы в ППУ изоляции в оболочке из полиэтилена', product_id: 11 },
  { id: 32, keywords: 'z образные элементы, z образный элемент',         description: 'Z-образные элементы в ППУ изоляции в оболочке из оцинкованной стали', product_id: 12 },
  { id: 33, keywords: 'переход ппу, переход +в ппу изоляции',         description: 'Переходы стальные в ППУ изоляции в оболочке из полиэтилена', product_id: 13 },
  { id: 34, keywords: 'переход ппу, переход +в ппу изоляции',         description: 'Переходы в ППУ изоляции в оболочке из оцинкованной стали', product_id: 14 },
  { id: 35, keywords: 'переходные элементы',         description: 'Переходные элементы для стыковки изделий с обычными трубопроводами', product_id: 15 },
  { id: 36, keywords: 'Компенсатор сильфонный фланцевый, компенсаторы сильфонные фланцевые, компенсатор сильфонный фланцевый цена',         description: 'Компенсатор сильфонный фланцевый', product_id: 16 },  
  { id: 37, keywords: 'Осевой сильфонный компенсатор, компенсатор сильфонный осевой, компенсатор сильфонный осевой ксо, КСО',         description: 'Осевой сильфонный компенсатор', product_id: 17 },
  { id: 38, keywords: 'Компенсаторы сильфонные универсальные,  КСУ',         description: 'Компенсаторы сильфонные универсальные', product_id: 18 },
  { id: 39, keywords: 'Опора скользящая хомутовая, хомутовая опора +для труб',         description: 'Опора скользящая хомутовая', product_id: 19 },
  { id: 40, keywords: 'Опора скользящая приварная, опора скользящая приварная тс 623.000, приварная опора +для труб',         description: 'Опора скользящая приварная', product_id: 20 },
  { id: 41, keywords: 'Опора скользящая ТС, опора скользящая, скользящая опора +для труб, скользящая опора +для труб ппу, опора скользящая направляющая',         description: 'Опора скользящая ТС', product_id: 21 },
  { id: 42, keywords: 'Z-образные элементы, z образный элемент, оцинкованной стали',         description: 'Z-образные элементы в ППУ изоляции в оболочке из оцинкованной стали', product_id: 22 },
  { id: 43, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 23 },
  { id: 44, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 24 },
  { id: 45, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 25 },
  { id: 46, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 26 },  
  { id: 47, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 27 },
  { id: 48, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 28 },
  { id: 49, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 29 },
  { id: 50, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 30 },
  


  { id: 51, keywords: 'Трубы ППУ +от производителя, псф строитель, строитель ппу, трубы ппу производитель, изоляция труб, теплоизоляция труб, производство труб, продажа труб, трубы полипропиленовые, трубы полиэтиленовые, трубы металлопластиковые, трубы водопроводные, инженерные сети, труба полиэтилен, трубы пэ',        	description: 'Компания ПСФ Строитель – динамично развивающееся предприятие, осуществляющее производство современных трубопроводов с изоляцией из полиэтилена и пенополиуретана, оснащенных СОДК – системой оперативного дистанционного контроля состояния трубопроводных систем.', service_id: 1 },
  { id: 52, keywords: 'Фасонные изделия, фасонные изделия труб,фасонные изделия +для трубопроводов, фасонные изделия ппу,фасонные изделия +в ппу изоляции',         				description: 'Фасонные изделия', service_id: 2 },
  { id: 53, keywords: 'элементы, теплотрасс, элементы теплотрасс, каналы, подушки, опорные подушки, тепловые камеры, жб кольца, ж/б кольца',         		description: 'Элементы теплотрасс', service_id: 3 },
  { id: 54, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 4 },
  { id: 55, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 5 },
  { id: 56, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 6 },
  { id: 57, keywords: 'Фильтр-патрон ФИПОС, ФИПОС-1,ФИПОС-2,ФИПОС-3,ФИПОС-4,Фильтр патрон, ФП, фп',         		description: 'Фильтр-патрон ФИПОС', service_id: 7 },
  { id: 58, keywords: 'Service meta key words',         		description: 'Service meta description', service_id: 8 },
  { id: 59, keywords: 'Производство бытовок, бытовки, строительные бытовки, производство дачных бытовок, бытовки дачные, изготовление бытовок, сборка бытовок',         		description: 'Производство бытовок', service_id: 9 },
  { id: 60, keywords: 'футеровка пластиком, футеровка +ж +б колодцев, футеровка колодцев, футеровка оборудования, футеровка',         		description: 'Футеровка ж/б колодцев', service_id: 10 },
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
