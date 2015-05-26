# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  Country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Province < ActiveRecord::Base
  belongs_to :Country
  has_many :districts, dependent: :destroy
  validates :name, presence: true
end
