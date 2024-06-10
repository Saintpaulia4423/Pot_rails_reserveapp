class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates :checkin, presence: :true
  validate :validate_date_checkin_after_today
  validates :checkout, presence: :true 
  validate :validate_date_checkout_after_checkin
  validates :person, presence: :true, numericality: { greater_than: 0, only_integer: true}


  #チェックイン日は本日以降の日付であるか確認する。
  #Time.now.strftime("%F")で日付だけの情報にし,1秒引くことで本日以降とする。
  def validate_date_checkin_after_today
    if checkin.present?
      if Time.parse(checkin.to_s).to_i <= Time.parse(Time.now.strftime("%F")).to_i - 1
        errors.add(:checkin,"は本日以降の日付を選択してください。")
      end
    end
  end

  #チェックアウトはチェックインより後の日付であるか確認する。
  def validate_date_checkout_after_checkin
    if checkin.present? && checkout.present?
      if Time.parse(checkout.to_s).to_i < Time.parse(checkin.to_s).to_i
        errors.add(:checkout,"はチェックイン日より後の日付を指定してください。")
      end
    end
  end
end
