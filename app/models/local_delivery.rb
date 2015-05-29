class LocalDelivery < ActiveRecord::Base
  belongs_to :local
  belongs_to :district
end
