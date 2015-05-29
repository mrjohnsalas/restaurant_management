class Local < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :district
  has_many :local_photos, dependent: :destroy
  has_many :local_deliveries, dependent: :destroy
  has_many :local_cards, dependent: :destroy
end
