module ReservationHelper
  #料金計算
  def h_price_cal(date, price, person)
    date * price * person
  end

  #日数計算
  def h_date_cal(checkin, checkout)
    subtime = Time.at(Time.parse(checkout.to_s).to_i - Time.parse(checkin.to_s).to_i)
    #UnixTimeから時分秒要素を除算して端数は四捨五入
    subtime = subtime.to_i/3600/24
    subtime.round
  end
end
