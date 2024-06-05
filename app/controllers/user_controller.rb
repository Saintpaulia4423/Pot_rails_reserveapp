class UserController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    @user.avatar = "default-avatar.png"
    if @user.save
      flash.now[:info] = "アカウントが作成されました"
      h_log_in @user
      redirect_to show_path
    else
      flash.now[:warning] = "入力に誤りがあります"
      render "new"
    end
  end

  def edit
  end

  def show
    h_logged_in?
  end

  def update
  end

  def destroy
  end

  def login
  end

  def logout
  end
end
