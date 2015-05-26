# == Schema Information
#
# Table name: districts
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  province_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class District < ActiveRecord::Base
  belongs_to :province
  validates :name, presence: true
end
