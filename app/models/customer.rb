class Customer < ApplicationRecord
  belongs_to :supermarket
   has_many :customer_items
   has_many :items, through: :customer_items

   def total_cost
    items.sum(:price)
   end

end
