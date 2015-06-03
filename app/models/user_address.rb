class UserAddress < ActiveRecord::Base
  belongs_to :district
  belongs_to :user
  
  def self.search(search)
	  if search
		  where("name like ?", "%#{search}%") 
	  end
  end
end
