class SessionController < ApplicationController
  def new
    @session = User.new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      reset_session
      h_log_in(@user)
      redirect_to show_path(@user)
    else
      flash.now[:danger] = "Emailかパスワードに誤りがあります"
      render "new"
    end
  end

  def destroy
    if h_logged_in?
      h_forget(h_current_user)
      redirect_to home_path
    end
  end
end
