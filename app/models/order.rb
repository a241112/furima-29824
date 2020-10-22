class Order
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :item_id, :user_id, :token

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を入れてください' }
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角文字で入力してください' }
    validates :house_number , format: { with: /\A[0-9-]+\z/, message: 'は半角数字で入力してください' }
    validates :phone_number, length: { maximum: 11 }, format: { with: /\A[0-9]+\z/, message: 'は半角数字で入力してください' }
    validates :token
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
