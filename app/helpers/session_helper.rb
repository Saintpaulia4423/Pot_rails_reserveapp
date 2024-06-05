module SessionHelper

  
  #ログイン情報をセッションとして登録する
  def h_log_in(user)
    session[:user_id] = user.id
    token = secure_token
    session[:session_token] = token 
    user.remenber(token)
  end

  #ログアウト
  def h_log_out(user)
    h_forget(user)
    flash[:info] = "ログアウトされました。"
  end

  #ロクインしているか判定
  def h_logged_in?
    !h_current_user.nil?
  end

  #ユーザー情報を返す
  def h_current_user
    #sessionでユーザーIDとセッショントークンを持っていなければnil
    if session[:user_id] && session[:session_token]
      #ユーザーIDは想定されやすいが、乱数のセッショントークンがなければ不正として強制解除
      user_check = User.find_by(id: session[:user_id])
      if user_check.session_token = session[:session_token]
        @current_user = user_check
      else
        h_forget(user_check)
        flash.now[:warning] = "無効なログイン情報です。再度ログインをお願いします。"
      end
    end
  end

  #ログインしているユーザー情報を消去する
  def h_forget(user)
    user.forget
    reset_session
  end

  private
    #乱数取得
    def random
      SecureRandom.urlsafe_base64
    end    
    #乱数を処理してトークンにするための中間処理用
    def secure_token
      random
    end

end 
