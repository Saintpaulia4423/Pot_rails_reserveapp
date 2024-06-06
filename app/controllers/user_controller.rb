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
      redirect_to show_path(@user)
    else
      flash.now[:warning] = "入力に誤りがあります"
      render "new"
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
    if h_logged_in?
      @user = User.find_by(id: params[:id])
      #edit_account処理
      #パスワード３種類が入力されていることを確認する。
      if params.require(:user)[:current_password] 
        if params.require(:user)[:password] && params.require(:user)[:password_confirmation]
          #新規パスワードとその再入力が合致しているか確認する。
          if params.require(:user)[:password] = params.require(:user)[:password_confirmation]
            #現在のパスワードで認証
            if @user.authenticate(params.require(:user)[:current_password])
              if @user.update(params.require(:user).permit(:id, :email, :password, :password_confirmation))
                flash.now[:info] = "アカウント情報が更新されました。"
                redirect_to show_path(@user)
              else
                flash.now[:warning] = "保存に失敗しました。"
                render "edit_account"
              end
            else
              flash.now[:warning] = "現在のパスワードに誤りがあります。"
              render "edit_account"
            end
          else
            flash.now[:warning] = "新規パスワードとパスワードの再入力が合致していません。"
            render "edit_account"
          end
        else
          flash.now[:warning] = "現在のパスワード/新規パスワード/パスワードの再入力の一部または全てが入力されていません。"
          render "edit_account"
        end
      end
      #edit_profile処理
      if params.require(:user)[:name]
        if @user.update(params.require(:user).permit(:name, :appeal, :image))
          flash.now[:info] = "アカウント情報が更新されました。"
          redirect_to show_path(@user)
        else
          flash.now[:warning] = "保存に失敗しました。"
          render "edit_profile"
        end
      end
    else
      h_unlogged_in
    end
  end


end
