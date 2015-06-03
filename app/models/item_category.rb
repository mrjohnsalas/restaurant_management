# == Schema Information
#
# Table name: item_categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class ItemCategory < ActiveRecord::Base
    validates :name, presence: true
    has_many :items, dependent: :destroy
    
    def self.search(search)
	    if search
		    where("name like ?", "%#{search}%") 
	    end
    end
end
