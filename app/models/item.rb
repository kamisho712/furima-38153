class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence:true
  validates :description, presence:true
  validates :category_id, presence:true
  validates :item_condition_id, presence:true
  validates :delivery_charge_id, presence:true
  validates :prefecture_id, presence:true
  validates :delivery_day_id, presence:true
  validates :price, presence:true
end
