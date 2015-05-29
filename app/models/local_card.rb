class LocalCard < ActiveRecord::Base
  belongs_to :local
  belongs_to :credit_card_type
end
