class AddAttachmentPhotoToLocalPhotos < ActiveRecord::Migration
  def self.up
    change_table :local_photos do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :local_photos, :photo
  end
end
