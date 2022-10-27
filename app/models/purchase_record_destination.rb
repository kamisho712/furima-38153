class PurchaseRecordDestination
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :token
  
  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, allow_blank: true, message: "must be single-byte numbers, including hyphens" }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, allow_blank: true, message: "must be at least 10 and no more than 11 single-byte digits" }, length: { minimum: 10, maximum: 11, allow_blank: true }
    validates :token
  end

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_record_id: purchase_record.id)
  end
end