class Menu < ActiveRecord::Base
  belongs_to :local
  belongs_to :item
end
