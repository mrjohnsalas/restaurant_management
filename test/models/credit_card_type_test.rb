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

require 'test_helper'

class CreditCardTypeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
