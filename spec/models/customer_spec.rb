require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'relationships' do
    it { should belong_to :supermarket }
    it { should have_many :customer_items }
    it { should have_many(:items).through :customer_items }
  end

  describe 'instance methods' do
    it '#tickets_by_age orders tickets from oldest to youngest' do
      supermarket = Supermarket.create(name: 'Walmart', location: 'Green Vally')
      customer1 = Customer.create(name: 'mike', supermarket_id: "#{supermarket.id}")
      customer2 = Customer.create(name: 'bill', supermarket_id: "#{supermarket.id}")
      item1 = Item.create(name: 'water', price: 1)
      item2 = Item.create(name: 'candy', price: 5)
      item3 = Item.create(name: 'chips', price: 3)
      ci1 = CustomerItem.create(customer_id: customer1.id, item_id: item1.id)
      ci2 = CustomerItem.create(customer_id: customer2.id, item_id: item2.id)
      ci3 = CustomerItem.create(customer_id: customer1.id, item_id: item3.id)

      expect(customer1.total_cost).to eq(4)
      
    end
  end
end
