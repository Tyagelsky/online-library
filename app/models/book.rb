class Book < ActiveRecord::Base
  has_attached_file :avatar, styles: { thumb: "100x100>", medium: "200x200>" },  :default_url => "missing_:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
end
