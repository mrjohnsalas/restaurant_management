class UserFavorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :object_type
end
