class Item < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :item_category
  belongs_to :food_category
  belongs_to :object_type
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end