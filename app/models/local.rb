class Local < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :district
end
