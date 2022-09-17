class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_PASSWORD_REGEX_2 = /\A[ぁ-んァ-ン一-龥]/
  VALID_PASSWORD_REGEX_3 = /\A[ァ-ヶー－]+\z/
  
  validates :nickname,          presence: true
  validates :family_name,       presence: true, format: { with: VALID_PASSWORD_REGEX_2, message: "is full-width characters"}
  validates :first_name,        presence: true, format: { with: VALID_PASSWORD_REGEX_2, message: "is full-width characters"}
  validates :family_name_kana,  presence: true, format: { with: VALID_PASSWORD_REGEX_3, message: "is full-width katakana"}
  validates :first_name_kana,   presence: true, format: { with: VALID_PASSWORD_REGEX_3, message: "is full-width katakana"}
  validates :birthday,          presence: true
  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "must contain letters and numbers"}


end
