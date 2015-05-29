class Local < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :district
  has_many :local_photos, dependent: :destroy
end
