class Order < ActiveRecord::Base
  belongs_to :local
  belongs_to :user
  belongs_to :payment_type
end
