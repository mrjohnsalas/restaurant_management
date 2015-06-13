# == Schema Information
#
# Table name: credit_card_types
#
#  id                :integer          not null, primary key
#  name              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class CreditCardType < ActiveRecord::Base
    has_attached_file :logo, styles: { large: "600x600>", medium: "300x300>", thumb: "75x75#" }
    validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/
    validates :name, presence: true
    has_many :user_cards, dependent: :destroy
    
    def self.search(search)
	    if search
		    where("name like ?", "%#{search}%") 
	    end
    end
end
