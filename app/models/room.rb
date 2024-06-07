class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :image

  validates :name, presence: :true
  validates :info, presence: :true
  validates :price, presence: :true, length: {minimum:1, 
                                              too_short: "は最低でも%{count}円以上を設定してください。"} 
  validates :address, presence: :true
end
