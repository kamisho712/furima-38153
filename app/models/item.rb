class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :delivery_charge
  belongs_to :prefecture
  belongs_to :delivery_day

  belongs_to :user
  has_one :purchase_record
  has_one_attached :image

  validates :name,               presence: true, length: { minimum: 1, maximum: 40, allow_blank: true }
  validates :description,        presence: true, length: { minimum: 1, maximum: 1000, allow_blank: true }
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id,  numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_day_id,    numericality: { other_than: 1, message: "can't be blank" }
  validates :price,              presence: true,
                                 numericality: { with: /\A[0-9]+\z/, allow_blank: true, only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  validates :image,              presence: true
end
