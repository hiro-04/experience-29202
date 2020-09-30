class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to :user
  has_many :comments
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :content
    validates :category
  end
  validates :category_id, numericality: { other_than: 1 }
end
