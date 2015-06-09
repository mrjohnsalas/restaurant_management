class OrderDelivery < ActiveRecord::Base
  belongs_to :order
  belongs_to :user_address
end
