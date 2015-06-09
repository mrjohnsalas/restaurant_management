class OrderCard < ActiveRecord::Base
  belongs_to :order
  belongs_to :user_card
end
