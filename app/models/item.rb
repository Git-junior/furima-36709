class Item < ApplicationRecord
  belongs_to :user

  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_time
  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :situation_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :delivery_time_id, presence: true, numericality: { other_than: 1, message: 'を選択して下さい' }
  validates :price, presence: true, format: { with: /\A[\d]+\z/ }, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  has_one :order
  has_many :comments
end
