class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :postage
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  belongs_to :user
  has_one :purchase
  has_one_attached :image

  validates :image, :name, :description, :category, :condition, :postage, :prefecture, :shipping_day, :price, presence: true
  validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :shipping_day_id
  end
  validates :prefecture_id, numericality: { other_than: 0 }
end
