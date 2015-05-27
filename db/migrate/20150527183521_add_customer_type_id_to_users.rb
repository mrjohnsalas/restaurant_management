class AddCustomerTypeIdToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :customer_type, index: true
  end
end
