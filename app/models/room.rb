class Room < ApplicationRecord
  belongs_to :user
  has_many :reservations
  has_one_attached :image

  validates :name, presence: :true
  validates :info, presence: :true
  validates :price, presence: :true, numericality: { greater_than: 0, only_integer: true }

  validates :address, presence: :true

  def self.search(search_type, word)
    if search_type == "area"
      Room.where("address Like?", "%#{word}%")
    elsif search_type == "free_word"
      Room.where(["address Like? or name Like?", "%#{word}%", "%#{word}%"])
    end
  end
end
