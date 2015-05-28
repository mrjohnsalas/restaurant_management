class UserAddress < ActiveRecord::Base
  belongs_to :district
  belongs_to :user
end
