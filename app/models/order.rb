class Order < ActiveRecord::Base
  belongs_to :local
  belongs_to :user
  belongs_to :payment_type
  has_many :order_details, dependent: :destroy
  has_many :order_cards, dependent: :destroy
  has_many :order_deliveries, dependent: :destroy
  
  def self.search(search)
    if search and search != ""
      selected_date = Date.parse(search)
      where(:order_date => selected_date.beginning_of_day..selected_date.end_of_day)
    end
  end
end
