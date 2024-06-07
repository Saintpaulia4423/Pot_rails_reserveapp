class RoomController < ApplicationController
  def index
  end

  def index_myroom
    @rooms = h_current_user.rooms
  end

  def new
    @room = h_current_user.rooms.build
  end

  def create
    @room = h_current_user.rooms.build(params.require(:room).permit(:name, :info, :appeal, :address, :price, :image))
    if @room.save
      flash.now[:info] = "施設を登録しました！"
      redirect_to index_myroom_path(h_current_user)
    else
      flash.now[:warning] = "登録できませんでした。"
      render "new"
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
