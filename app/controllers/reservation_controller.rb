class ReservationController < ApplicationController
  def index
    @reservations = Reservation.where(user_id: h_current_user.id)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    if h_logged_in?
      @reservation = h_current_user.reservations.build(
                          params.require(:reservation).
                          permit(:checkin,:checkout,:person))
      @reservation.room_id = params[:room_id]
      if @reservation.save
        flash.now[:info] = "予約されました。"
        redirect_to show_reservation_path(@reservation)
      else
        flash.now[:warning] = "保存できませんでした。"
        render "new"
      end
    else
      h_unlogged_in
    end
  end

  def show
    @reservation = Reservation.find_by(id: params[:id])
  end

end
