class UserController < ApplicationController


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
      render "/new"
    end
  end

  def edit_account
    if h_logged_in?
      @user = h_current_user
    else
      h_unlogged_in
    end
  end
  
  def edit_profile
    if h_logged_in?
      @user = h_current_user
    else
      h_unlogged_in
    end
  end

  def show
    if h_logged_in?
      @user = h_current_user
    else
      h_unlogged_in
    end
  end

  def update
    @user = User.find_by(params[:id])
    if @user.update(user_params)
      flash.now[:info] = "ユーザー情報を更新しました。"
      redirect_to "/show"
    else
      flash.now[:warning] = "入力内容に問題があります。"
      render "/edit"
    end
  end

  def destroy
  end

  def login
  end

  def logout
  end
end
