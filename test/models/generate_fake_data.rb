Customer.delete_all
CreditCard.delete_all
LineItem.delete_all
Order.delete_all

product_ids = Product.pluck(:id)

25.times do
  customer = Customer.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email)
  puts "created customer #{customer.name}"
  cc = customer.credit_cards.create!(
    card_number: Faker::Business.credit_card_number)
  puts "created cc #{cc.card_number}"

  (rand(5) + 1).times do
    order = customer.orders.create!
    puts "Placed order #{order.id}"

    pids = product_ids.dup
    (rand(5) + 1).times do
      li = order.line_items.create!(product_id: pids.shuffle!.pop,
                                    quantity: rand(5) + 1)
      puts li.inspect
    end
  end
end