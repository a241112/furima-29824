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

  validates :image, :name, :description, :category, :condition, :postage, :prefecture, :shipping_day, presence: true
  validates :price, presence: true, format: { with: /\A[0-9]+\z/ , message: "は半角数字で入力してください" }, inclusion: { in: 300..9_999_999, message: "は¥300~¥9,999,999で入力してください" }

  with_options numericality: { other_than: 1, message: "を選択してください" } do
    validates :category_id
    validates :condition_id
    validates :postage_id
    validates :shipping_day_id
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
end
