class LocalPhoto < ActiveRecord::Base
  belongs_to :local
  has_attached_file :photo, styles: { large: "600x600>", medium: "300x300>", thumb: "50x50#" }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
