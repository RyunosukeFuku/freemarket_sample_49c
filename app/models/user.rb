class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  has_many :evaluations, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_one :credit, dependent: :destroy

  validates :nickname, :email, :firstname_fullangle, :lastname_fullangle, :firstname_kana, :lastname_kana, :birthday, :postal_cord, :prefecture, :city, :address_number, presence: true
  validates :firstname_kana, :lastname_kana, format: { with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/ }
  validates :nickname, :email, uniqueness: true
  validates :nickname, length: { maximum: 20 }
  validates :password, presence: true, unless: :uid?
end
