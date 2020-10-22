class User < ApplicationRecord
  has_many :items
  has_many :purchases
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :birthday, presence: true
  validates :password, confirmation: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i , message: "は半角英数時混合で入力してください" }
  validates :email, uniqueness: true, format: { with: /@/ , message: "は@を入れてください" }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ , message: "は全角文字で入力してください" } do
    validates :first_name
    validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ン]+\z/ , message: "は全角カタカナで入力してください" } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
