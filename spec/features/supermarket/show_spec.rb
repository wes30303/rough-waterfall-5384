require 'rails_helper'

RSpec.describe Employee: :Show do
  it 'will show the supermarket name on the show page' do
    supermarket = Supermarket.create(name: 'Walmart', location: 'Green Vally')
    customer1 = Customer.create(name: 'mike', supermarket_id: "#{supermarket.id}")
    customer2 = Customer.create(name: 'bill', supermarket_id: "#{supermarket.id}")
    item1 = Item.create(name: 'water', price: 1)
    item2 = Item.create(name: 'candy', price: 5)
    item3 = Item.create(name: 'chips', price: 3)
    ci1 = CustomerItem.create(customer_id: customer1.id, item_id: item1.id)
    ci2 = CustomerItem.create(customer_id: customer2.id, item_id: item2.id)
    ci3 = CustomerItem.create(customer_id: customer1.id, item_id: item3.id)

    visit supermarket_path(supermarket.id)

    expect(page).to have_content('Walmart')
    click_link ("Supermarket Index")
    expect(page).to have_content('Supermarket Index Page')

  end

end
