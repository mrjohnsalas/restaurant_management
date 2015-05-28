class UserCard < ActiveRecord::Base
  belongs_to :credit_card_type
  belongs_to :user
end
