class Menu < ActiveRecord::Base
  belongs_to :local
  belongs_to :item
  has_many :shopping_carts, dependent: :destroy
  
  def self.search(search)
    if search and search != ""
      selected_date = Date.parse(search)
      where(:menu_date => selected_date.beginning_of_day..selected_date.end_of_day)
    end
  end
end
