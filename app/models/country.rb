# == Schema Information
#
# Table name: countries
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Country < ActiveRecord::Base
    has_many :provinces, dependent: :destroy
    validates :name, presence: true
    
    def self.search(search)
	    if search
		    where("name like ?", "%#{search}%") 
	    end
    end
end
