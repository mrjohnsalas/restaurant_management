class Item < ActiveRecord::Base
  acts_as_votable
  belongs_to :restaurant
  belongs_to :item_category
  belongs_to :food_category
  belongs_to :object_type
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  has_many :menus, dependent: :destroy
  has_many :user_reviews, dependent: :destroy
end
