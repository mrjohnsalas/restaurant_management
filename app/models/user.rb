class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  has_many :restaurants, dependent: :destroy
  has_many :user_cards, dependent: :destroy
  has_many :user_addresses, dependent: :destroy
  has_many :user_favorites, dependent: :destroy
  has_many :user_points, dependent: :destroy
  belongs_to :user_types
end
