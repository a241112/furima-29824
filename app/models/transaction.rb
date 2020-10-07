class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_oen :address
end
