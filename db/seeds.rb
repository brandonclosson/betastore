clothing = Category.create!(name: 'Clothing')
headwear = Category.create!(name: 'Head Wear')
misc = Category.create!(name: 'Misc')

hat = Product.create!(
  name: 'Hat',
  price: 7.99,
  image_url: "products/hat.jpg",
  categories: [clothing, headwear])
Product.create!(name: 'Hoodie', price: 21.99, image_url: "products/hoodie.jpg")
Product.create!(name: 'iPhone Case', price: 9.99, image_url: "products/iphone_case.jpg")
Product.create!(name: 'Journal', price: 11.99, image_url: "products/journal.jpg")
Product.create!(name: 'Shirt', price: 15.99, image_url: "products/shirt.jpg")
Product.create!(name: 'Sticker', price: 2.99, image_url: "products/sticker.jpg")

User.create!(email: 'bclosson@gmail.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')