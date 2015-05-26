class District < ActiveRecord::Base
  belongs_to :province
  validates :name, presence: true
end
