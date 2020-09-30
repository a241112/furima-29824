class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  has_one_attached :image

  validates :image, :name, :describe, :category, :condition, :postage, :prefecture, :shipping_day, :price, presence: true
  validates :price , format: { with: /\A[0-9]+\z/}, inclusion: {in: 300..9999999 }

  validates :category_id, :condition, :postage, :shipping_day, numericality: { other_than: 1 } 
  validates :prefecture_id, numericality: { other_than: 0 } 
end
