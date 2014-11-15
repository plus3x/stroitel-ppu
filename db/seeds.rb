# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
users = User.create([
  { id: '1',
    role: 'Role::Admin',
    name: 'admin',
    password: 'PasswordAdmina',
    password_confirmation: 'PasswordAdmina' },
  { id: '2',
    role: 'Role::Manager',
    name: 'manager',
    password: 'PasswordManagera',
    password_confirmation: 'PasswordManagera' }
])
if users[0].save and users[1].save
  puts "Default users: " + users.map(&:id).join(', ')
else
  puts '>>> User not created!'
end

Service.destroy_all
services = [
  { name: 'Трубы ППУ',        
  title: 'Трубы ППУ от производителя', 
  picture_url: nil, 
  description: open('db/descriptions/services/pipes.html').read },
  { name: 'Фасонные изделия', 
  title: 'Фасонные изделия',           
  picture_url: nil, 
  description: open('db/descriptions/services/formed-parts.html').read },
  { name: 'Элементы теплотрасс',      
  title: 'Элементы теплотрасс',              
  picture_url: nil, 
  description: open('db/descriptions/services/heating_mains.html').read },
  { name: 'Комплекты заделки стыков',      
  title: 'Комплекты заделки стыков',              
  picture_url: nil, 
  description: open('db/descriptions/services/sealing_joints.html').read },
  { name: 'Строительство и реконструкция инженерных сетей',      
  title: 'Строительство и реконструкция наружных инженерных сетей (канализация, тепловые сети, водопровод)',              
  picture_url: nil, 
  description: open('db/descriptions/services/external_utilities.html').read },
  { name: 'Винтовые сваи',      
  title: 'Изготовление и монтаж стальных винтовых свай (любой длины и диаметра для строительства дачных домой и коттеджей)',              
  picture_url: nil, 
  description: open('db/descriptions/services/screw_piles.html').read },
  { name: 'Фильтр-патрон ФИПОС',      
  title: 'Изготовление фильтр-патронов для очистки сточных вод',              
  picture_url: nil, 
  description: open('db/descriptions/services/filter.html').read },
  { name: 'Изготовление качелей',      
  title: 'Изготовление качелей (по индивидуальным заказам или готовые усиленной подъемности)',              
  picture_url: nil, 
  description: open('db/descriptions/services/seesaw.html').read },
  { name: 'Производство бытовок',      
  title: 'Производство бытовок',              
  picture_url: nil, 
  description: open('db/descriptions/services/huts.html').read },
  { name: 'Футеровка пластиком внутренней поверхности железобетонных колодцев',      
  title: 'Футеровка пластиком внутренней поверхности железобетонных колодцев',              
  picture_url: nil, 
  description: open('db/descriptions/services/foterovka.html').read },
  { name: 'Конструирование оборудования и изготовление станков',      
  title: 'Конструирование оборудования и изготовление станков',              
  picture_url: nil, 
  description: open('db/descriptions/services/stanki.html').read }
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
  { name: 'Отводы в ППУ изоляции',     title: 'Отводы в ППУ изоляции', picture_url: nil, service_id: 2,
    description: open('db/descriptions/type_of_products/taps_in_foam_insulation.html').read },
  { name: 'Тройники в ППУ изоляции',     title: 'Тройники в ППУ изоляции', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/tees.html').read },
  { name: 'Тройниковые ответвления',     title: 'Тройниковые ответвления', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/tee_branch.html').read },
  { name: 'Тройники параллельные',       title: 'Тройники параллельные', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/tee_parallel.html').read },
  { name: 'Z-образные элементы',       title: 'Z-образные элементы', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/z-type.html').read },
  { name: 'Каналы непроходные',      title: 'Каналы непроходные', picture_url: nil, service_id: 3, 
    description: open('db/descriptions/type_of_products/impassable_channels.html').read },
  { name: 'Опорные подушки',       title: 'Опорные подушки', picture_url: nil, service_id: 3, 
    description: open('db/descriptions/type_of_products/opornie-podushki.html').read },
  { name: 'Тепловые камеры',       title: 'Тепловые камеры', picture_url: nil, service_id: 3, 
    description: open('db/descriptions/type_of_products/thermal_cameras.html').read },
  { name: 'Ж/б кольца для колодцев',       title: 'Железо/бетонные кольца для колодцев', picture_url: nil, service_id: 3, 
    description: open('db/descriptions/type_of_products/rings-for-wells.html').read },
  { name: 'Скорлупа ППУ для изоляции труб', title: 'Скорлупа ППУ для изоляции труб', picture_url: nil, service_id: 4, 
    description: open('db/descriptions/type_of_products/shell.html').read },
  { name: 'Лента термоусаживаемая',       title: 'Лента термоусаживаемая', picture_url: nil, service_id: 4, 
    description: open('db/descriptions/type_of_products/termo_lenta.html').read },
  { name: 'Термоусаживающаяся муфта',       title: 'Термоусаживающаяся муфта', picture_url: nil, service_id: 4, 
    description: open('db/descriptions/type_of_products/sleeve.html').read },
  { name: 'Пенопакет',      title: 'Пенопакет', picture_url: nil, service_id: 4, 
    description: open('db/descriptions/type_of_products/packet.html').read },
  { name: 'Переходы',       title: 'Переходы', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/transitions.html').read },
  { name: 'Cильфонный компенсатор',       title: 'Cильфонный компенсатор', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/compensator.html').read },
  { name: 'Скользящие опоры',       title: 'Скользящие опоры', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/skolizyaschie_opory.html').read },
  { name: 'Неподвижные щитовые опоры',      title: 'Неподвижные щитовые опоры', picture_url: nil, service_id: 2, 
    description: open('db/descriptions/type_of_products/fixed-ppu.html').read },
  { name: 'Концевые элементы',      title: 'Концевые элементы', picture_url: nil, service_id: 2, 
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
  { name: 'Отводы в ППУ изоляции в оболочке из пэ',          
  title: 'Отводы в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',          
  picture_url: nil, 
  type_of_product_id: 1, 
  description: open('db/descriptions/products/taps_in_foam_insulation_pe.html').read },
  { name: 'Отводы в ППУ изоляции в оболочке из оц',   
  title: 'Отводы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',   
  picture_url: nil, 
  type_of_product_id: 1, 
  description: open('db/descriptions/products/taps_in_foam_insulation_oc.html').read },
  { name: 'Двойные отводы',                                           
  title: 'Двойные отводы | ПСФ Строитель',                                           
  picture_url: nil, 
  type_of_product_id: 1, 
  description: open('db/descriptions/products/taps_in_foam_insulation_double.html').read },
  { name: 'Тройники в ППУ изоляции в оболочке из пэ',        
  title: 'Тройники в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',        
  picture_url: nil, 
  type_of_product_id: 2, 
  description: open('db/descriptions/products/tees_pe.html').read },
  { name: 'Тройники в ППУ изоляции в оболочке из оц', 
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
  { name: 'Тройниковые ответвления в ППУ изоляции в оболочке из пэ',                                         
  title: 'Тройниковые ответвления в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 3, 
  description: open('db/descriptions/products/tee_branch_pe.html').read },
  { name: 'Тройниковые ответвления в ППУ изоляции в оболочке из оц',                                         
  title: 'Тройниковые ответвления в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 3, 
  description: open('db/descriptions/products/tee_branch_oc.html').read },
  { name: 'Тройники параллельные в ППУ изоляции в оболочке из пэ',                                         
  title: 'Тройники параллельные в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 4, 
  description: open('db/descriptions/products/tee_parallel_pe.html').read },
  { name: 'Тройники параллельные в ППУ изоляции в оболочке из оц',                                         
  title: 'Тройники параллельные в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 4, 
  description: open('db/descriptions/products/tee_parallel_oc.html').read },
  { name: 'Z-образные элементы из пэ',                                         
  title: 'Z-образные элементы в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 5, 
  description: open('db/descriptions/products/z-type_pe.html').read },
  { name: 'Z-образные элементы из оц',                                         
  title: 'Z-образные элементы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 5, 
  description: open('db/descriptions/products/z-type_oc.html').read },
  { name: 'Переходы стальные в ППУ изоляции в оболочке из пэ',                                         
  title: 'Переходы стальные в ППУ изоляции в оболочке из полиэтилена | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 14, 
  description: open('db/descriptions/products/transitions_pe.html').read },
  { name: 'Переходы в ППУ изоляции в оболочке из оц',                                         
  title: 'Переходы в ППУ изоляции в оболочке из оцинкованной стали | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 14, 
  description: open('db/descriptions/products/transitions_oc.html').read },
  { name: 'Переходные элементы',                                         
  title: 'Переходные элементы для стыковки изделий с обычными трубопроводами | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 14, 
  description: open('db/descriptions/products/transitions_ather.html').read },
  { name: 'Компенсатор сильфонный фланцевый',                                         
  title: 'Компенсатор сильфонный фланцевый | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 15, 
  description: open('db/descriptions/products/compensator_fl.html').read },
  { name: 'Осевой сильфонный компенсатор',                                         
  title: 'Осевой сильфонный компенсатор | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 15, 
  description: open('db/descriptions/products/compensator_os.html').read },
  { name: 'Компенсаторы сильфонные универсальные',                                         
  title: 'Компенсаторы сильфонные универсальные | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 15, 
  description: open('db/descriptions/products/compensator_un.html').read },
  { name: 'Опора скользящая хомутовая',                                         
  title: 'Опора скользящая хомутовая | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 16, 
  description: open('db/descriptions/products/skolizyaschie_opory_hom.html').read },
  { name: 'Опора скользящая приварная',                                         
  title: 'Опора скользящая приварная | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 16, 
  description: open('db/descriptions/products/skolizyaschie_opory_pr.html').read },
  { name: 'Опора скользящая ТС',                                         
  title: 'Опора скользящая ТС | ПСФ Строитель',                                         
  picture_url: nil, 
  type_of_product_id: 16, 
  description: open('db/descriptions/products/skolizyaschie_opory_tc.html').read },
  { name: 'Z-образные элементы в ППУ изоляции в оболочке из оц',                                         
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

  { id: 1,  keywords: 'отводы +в ппу изоляции, вес отводов +в ппу изоляции, отвод стальной +в изоляции ппу',          description: 'Отводы в ППУ изоляции', type_of_product_id: 1 },
  { id: 2,  keywords: 'тройник +в ппу изоляции, тройник +в ппу',        description: 'Тройники в ППУ изоляции', type_of_product_id: 2 },
  { id: 3,  keywords: 'Тройниковые ответвления, тройниковое ответвление +в ппу, тройниковые ответвления +в оц',         description: 'Тройниковые ответвления', type_of_product_id: 3 },
  { id: 4,  keywords: 'Тройники параллельные,тройник параллельный',     description: 'Тройник параллельный', type_of_product_id: 4 },
  { id: 5,  keywords: 'Z-образные элементы, z образный элемент',    description: 'Z-образные элементы', type_of_product_id: 5 },
  { id: 6,  keywords: 'Непроходной канал, каналы непроходные кн, канал непроходной кн, прокладка трубопроводов, непроходной канал размерых',    description: 'Непроходной канал (КН) применяются для прокладки инженерных сетей и коммуникаций.', type_of_product_id: 6 },
  { id: 7, keywords: 'Опорные подушки ппу,опорная подушка, оп ппу',     description: 'Опорные подушки', type_of_product_id: 7 },
  { id: 8, keywords: 'Тепловые камеры, камеры тепловых сетей, камера тепловой сети, теплосети тепловая камера',     description: 'Тепловые камеры предназначены для оборудования узлов пересечения каких-либо сетей.', type_of_product_id: 8 },
  { id: 9, keywords: 'Железо/бетонные кольца, кольца, жб кольца, ж/б кольца',     description: 'Железо/бетонные кольца для колодцев', type_of_product_id: 9 },
  { id: 10, keywords: 'ппу, скорлупа, скорлупа ппу, пенополиуретан, теплоизоляция труб, крошка ппу, плита ппу', description: 'Скорлупа ППУ из пенополиуретана от производителя, скорлупа ппу для теплоизоляции труб', type_of_product_id: 10 },
  { id: 11, keywords: 'термоусаживаемая лента, термоусадочная лента, лента термоусаживаемая, лента термоусадочная',     description: 'Tермоусаживаемая лента от производителя, отличающаяся высокой прочностью.', type_of_product_id: 11 },
  { id: 12, keywords: 'Термоусаживающиеся муфты, муфты, муфты термоусаживаемые, муфта соединительная для труб,  термоусадочная муфта, производство муфт, муфта пэ, муфты трубопроводов, монтаж концевых муфт',    description: 'Муфты термоусаживаемые от производителя, отличающаяся высокой прочностью.', type_of_product_id: 12 },
  { id: 13, keywords: 'Пенопакет Монтажный ПМб, пенопакет монтажный, пенопакет',    description: 'Пенопакет монтажный - несколько герметичных камер, содержащих компоненты ППУ. Между собой они разделяются перемычкой и оснащены специальной горловиной', type_of_product_id: 13 },
  { id: 14, keywords: 'переходы в ппу',     description: 'Переходы ППУ для трубопроводов в ППУ изоляции от производителя', type_of_product_id: 14 },
  { id: 15, keywords: 'компенсаторы, сильфонный компенсатор, осевой компенсатор, компенсатор сильфонный осевой, сильфонный компенсатор +в ппу',     description: 'Сильфонные компенсаторы позволяют исключить различные деформации на трубопроводах под влиянием перепада температур или вибраций', type_of_product_id: 15 },
  { id: 16, keywords: 'Скользящие опоры, опора под скользящую опору,изготовление скользящих опор,скользящие +и неподвижные опоры, скользящие опоры ппу',    description: 'Скользящие опоры', type_of_product_id: 16 },
  { id: 17, keywords: 'Неподвижные щитовые опоры, НЩО, опора неподвижная щитовая, неподвижные щитовые опоры +для трубопроводов, неподвижная щитовая опора ппу',     description: 'Неподвижные щитовые опоры', type_of_product_id: 17 },
  { id: 18, keywords: 'Концевые элементы,концевые элементы ппу,концевой элемент трубопровода,концевой элемент',     description: 'Концевые элементы', type_of_product_id: 18 },
  { id: 19, keywords: 'Type of product meta key words',     description: 'Type of product meta description', type_of_product_id: 19 },
  { id: 20, keywords: 'Type of product meta key words',     description: 'Type of product meta description', type_of_product_id: 20 },
 
  { id: 21, keywords: 'Product meta key words',         description: 'Product meta descRCJription', product_id: 1 },
  { id: 22, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 2 },
  { id: 23, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 3 },
  { id: 24, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 4 },
  { id: 25, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 5 },
  { id: 26, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 6 },
  { id: 27, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 7 },
  { id: 28, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 8 },
  { id: 29, keywords: 'Product meta key words',         description: 'Product meta description', product_id: 9 },
  { id: 30, keywords: 'Скорлупа ППУ, ппу скорлупа +для труб, скорлупы ппу изоляция труб, скорлупа ппу +для трубопроводов',         description: 'Пенополиуретановые скорлупы ППУ предназначены для изоляции труб, а также их стыков вместе с отводами и другими фасонными частями.', product_id: 10 },
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
  


  { id: 51, keywords: '
    Трубы ППУ +от производителя, псф строитель, строитель ппу, трубы ппу производитель, изоляция труб, производство труб, трубы полипропиленовые, труба полиэтилен, трубы пэ',          description: 'ПСФ Строитель – динамично развивающееся предприятие, осуществляющее производство современных трубопроводов', service_id: 1 },
  { id: 52, keywords: 'Фасонные изделия, фасонные изделия труб,фасонные изделия +для трубопроводов, фасонные изделия ппу,фасонные изделия +в ппу изоляции',                 description: 'Фасонные изделия', service_id: 2 },
  { id: 53, keywords: 'элементы, теплотрасс, элементы теплотрасс, каналы, подушки, опорные подушки, тепловые камеры, жб кольца, ж/б кольца',            description: 'Элементы теплотрасс', service_id: 3 },
  { id: 54, keywords: 'Service meta key words',             description: 'Service meta description', service_id: 4 },
  { id: 55, keywords: 'Service meta key words',             description: 'Service meta description', service_id: 5 },
  { id: 56, keywords: 'Service meta key words',             description: 'Service meta description', service_id: 6 },
  { id: 57, keywords: 'Фильтр-патрон ФИПОС, ФИПОС-1,ФИПОС-2,ФИПОС-3,ФИПОС-4,Фильтр патрон, ФП, фп, фильтр патрон +для ливневой канализации',            description: 'Фильтр-патрон ФИПОС', service_id: 7 },
  { id: 58, keywords: 'Service meta key words',             description: 'Service meta description', service_id: 8 },
  { id: 59, keywords: 'Производство бытовок, бытовки, строительные бытовки, производство дачных бытовок, бытовки дачные, изготовление бытовок, сборка бытовок',             description: 'Производство бытовок', service_id: 9 },
  { id: 60, keywords: 'футеровка пластиком, футеровка +ж +б колодцев, футеровка колодцев, футеровка оборудования, футеровка',             description: 'Футеровка ж/б колодцев', service_id: 10 },
  { id: 61, keywords: 'Конструирование оборудования, изготовление станков, спирально навивные воздуховоды, воздуховоды',            description: 'Конструирование оборудования и изготовление станков, спирально-навивные воздуховоды', service_id: 11 },
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
