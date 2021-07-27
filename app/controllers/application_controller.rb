class ApplicationController < ActionController::Base
  before_action :set_current_user

  # sessionから値を取得
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # ログイン判定(ログインしてない場合)
  def authenticate_user
    if @current_user == nil
      flash[:notice] = "ログインが必要です"
      redirect_to("/login")
    end
  end

  # ログインユーザーが禁止する処理
  def forbid_login_user
    if @current_user
      flash[:notice] = "すでにログインしています"
      redirect_to("/posts/index")
    end
  end
  
end
