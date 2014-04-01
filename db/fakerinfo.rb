Customer.delete_all
Product.delete_all
LineItem.delete_all
CreditCard.delete_all
Order.delete_all

pbar = ProgressBar.new("Progress", 100)

100.times do
  Product.create!(
    name: Faker::Commerce.product_name, 
    price: Faker::Commerce.price)
end

100.times do 
  customer = Customer.create!(
    name: Faker::Name.name, 
    email: Faker::Internet.email)

  customer.credit_cards.create!(
    customer: customer, 
    card_number: Faker::Business.credit_card_number, 
    expires_on: Faker::Business.credit_card_expiry_date)

  rand(1..5).times do
    order = customer.orders.create!

    product_ids = Product.pluck(:id)

    rand(1..5).times do
      random_product_id = product_ids.sample
      product_ids.delete(random_product_id)

      line_item = order.line_items.create!(
        product_id: random_product_id, 
        quantity: rand(1..5))
    end
  end

  pbar.inc

end

pbar.finish