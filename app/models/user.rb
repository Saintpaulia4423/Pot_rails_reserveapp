class User < ApplicationRecord
  has_many :reservations
  has_many :rooms
  has_one_attached :image

  before_save { email.downcase! }
  VALIDATE_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :name, presence: :true
  validates :email, presence: :true, format: { with: VALIDATE_EMAIL}, uniqueness: true
  has_secure_password

  #セッショントークンを削除
  def forget
    update_attribute(:session_token, nil)
  end

  #セッショントークンを登録
  def remenber(token)
    update_attribute(:session_token, token)
  end

end
