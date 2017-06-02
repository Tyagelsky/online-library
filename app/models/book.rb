class Book < ActiveRecord::Base
  has_attached_file :avatar, styles: { thumb: "100x100>", medium: "200x200>" },  :default_url => "missing_:style.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, presence: true, length: {minimum: 1, maximum: 50}
  validates :authors, presence: true, length: {minimum: 3, maximum: 100}
  validates :description, presence: true, length: {minimum: 10, maximum: 450}

  has_many :book_categories
  has_many :categories, through: :book_categories

end
