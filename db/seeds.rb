Category.create!([
  {name: "Все", category_id: nil},
  {name: "Мясо/Рыба/Яйца", category_id: 1},
  {name: "Молочная продукция", category_id: 1},
  {name: "Молоко", category_id: 3},
  {name: "Кисломолочные продукты", category_id: 3},
  {name: "Сыры", category_id: 3},
  {name: "Творог", category_id: 3},
  {name: "Мясо", category_id: 2},
  {name: "Птица", category_id: 2},
  {name: "Рыба", category_id: 2},
  {name: "Яйца", category_id: 2},
  {name: "Напитки", category_id: 1},
  {name: "Безалкогольные", category_id: 12},
  {name: "Ликёроводочные изделия", category_id: 12},
  {name: "Вина", category_id: 12},
  {name: "Слабоалкогольные", category_id: 12},
  {name: "Овощи/фрукты", category_id: 1},
  {name: "Крупы", category_id: 1}
])
Producer.create!([
  {name: "Rainford"},
  {name: "Злагода"},
  {name: "Балтимор"}
])
Retailer.create!([
  {name: "АТБ Маркет"},
  {name: "Сильпо"},
  {name: "Варус"}
])

Product.create!([
  {name: "Молоко детское 1л", price: 19.0, count: 10, category_id: 4, producer_id: 2, retailer_id: 1},
  {name: "Завтрак туриста", price: 17.5, count: 10, category_id: 1, producer_id: 3, retailer_id: 3},
  {name: "Молоко, 1л.",   price: 18.2, count: 10, category_id: 4, producer_id: 2, retailer_id: 2},
  {name: "Соль повареная 1кг", price: 12.0, count: 100, category_id: 1, producer_id: nil, retailer_id: 3},
  {name: "Вода Bonaqua 5л", price: 23.0, count: 15, category_id: 15, producer_id: 1, retailer_id: 1},
  {name: "Валенки",       price: 250.0, count: 3, category_id: 1, producer_id: nil, retailer_id: 1},
  {name: "Лук репчатый",  price: 5.6, count: 24, category_id: 17, producer_id: nil, retailer_id: 2},
  {name: "Картошка",      price: 4.56, count: 120, category_id: 17, producer_id: nil, retailer_id: 2},
  {name: "Гречка",        price: 11.45, count: 15, category_id: 18, producer_id: 1, retailer_id: 1},
  {name: "Пшено",         price: 12.5, count: 15, category_id: 18, producer_id: 1, retailer_id: 1},
  {name: "Рис",           price: 10.5, count: 15, category_id: 18, producer_id: 2, retailer_id: 3},
  {name: "Прловка 1кг",   price: 10.4, count: 15, category_id: 18, producer_id: 1, retailer_id: 1},
  {name: "Каша Овсяная",  price: 10.3, count: 15, category_id: 18, producer_id: 3, retailer_id: 2},
  {name: "Каша Артек",    price: 15.2, count: 15, category_id: 18, producer_id: 3, retailer_id: 2},
  {name: "Геркулес",      price: 10.1, count: 15, category_id: 18, producer_id: 2, retailer_id: 1}
])

user = User.new
user.email = 'admin@shop.rubysquad.pp.ua'
user.role = 'admin'
user.password = 'password'
user.password_confirmation = 'password'
user.skip_confirmation_notification!
user.confirmed_at = Time.now.to_formatted_s(:db)
user.save!
