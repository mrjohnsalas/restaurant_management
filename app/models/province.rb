# == Schema Information
#
# Table name: provinces
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class Province < ActiveRecord::Base
  belongs_to :country
  has_many :districts, dependent: :destroy
  validates :name, presence: true
  
  def self.search(search)
	  if search
		  where("name like ?", "%#{search}%")
	  end
  end
end
