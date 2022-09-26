class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one_attached :image

  validates :name,               presence:true
  validates :description,        presence:true
  validates :category_id,        numericality: { other_than: 1 , message: "can't be blank"}
  validates :item_condition_id,  numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id,      numericality: { other_than: 1 , message: "can't be blank"}
  validates :delivery_day_id,    numericality: { other_than: 1 , message: "can't be blank"}
  validates :price,              presence:true
end
