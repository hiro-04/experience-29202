class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles
  has_many :comments
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy

  # user validation
  with_options presence: true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :family_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :email
    validates :birthday
  end
end
