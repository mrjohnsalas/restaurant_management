# == Schema Information
#
# Table name: object_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ObjectType < ActiveRecord::Base
    validates :name, presence: true
    has_many :restaurants, dependent: :destroy
    has_many :user_favorites, dependent: :destroy
    has_many :items, dependent: :destroy
end
