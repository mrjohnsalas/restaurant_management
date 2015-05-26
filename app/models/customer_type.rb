# == Schema Information
#
# Table name: customer_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class CustomerType < ActiveRecord::Base
    validates :name, presence: true
end
