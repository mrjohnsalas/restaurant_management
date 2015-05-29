class Restaurant < ActiveRecord::Base
  belongs_to :user
  belongs_to :object_type
  has_attached_file :logo, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
  has_many :user_points, dependent: :destroy
  has_many :locals, dependent: :destroy
end
