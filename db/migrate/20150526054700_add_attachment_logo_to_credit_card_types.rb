class AddAttachmentLogoToCreditCardTypes < ActiveRecord::Migration
  def self.up
    change_table :credit_card_types do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :credit_card_types, :logo
  end
end
