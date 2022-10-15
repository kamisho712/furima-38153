class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_record_id
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: "is invalid." }
    validates :purchase_record_id
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end