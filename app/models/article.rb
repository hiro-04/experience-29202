class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_many :likes

  with_options presence: true do
    validates :image
    validates :title
    validates :content
    validates :category
  end
  validates :category_id, numericality: { other_than: 1 }

  def self.search(search)
    search ? where('title LIKE ?', "%#{search}%") : all
  end

end
