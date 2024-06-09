class RoomController < ApplicationController
  def index
  end

  def search
    type = params[:type]
    word = params[:word]
    @records = Room.search(type, word)
    if town_area = params[:town_area]
      @records = @records.where("address Like?", "%#{town_area}%")
    end
  end

  def index_myroom
    if h_logged_in?
      @rooms = h_current_user.rooms
    else
      h_unlogged_in
    end
  end

  def new
    if h_logged_in?
      @room = h_current_user.rooms.build
    else
      h_unlogged_in
    end
  end

  def create
    if h_logged_in?
      @room = h_current_user.rooms.build(params.require(:room).permit(:name, :info, :appeal, :address, :price, :image))
      if @room.save
        flash.now[:info] = "施設を登録しました！"
        redirect_to index_myroom_path(h_current_user)
      else
        flash.now[:warning] = "登録できませんでした。"
        render "new"
      end
    else
      h_unlogged_in
    end
  end

  def edit
  end

  def show
    @room = Room.find_by(id: params[:id])
  end

  def update
  end

  def destroy
  end

end
