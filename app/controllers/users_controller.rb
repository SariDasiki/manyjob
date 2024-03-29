class UsersController < ApplicationController
  before_action :correct_user, only: [:show]
  skip_before_action :login_required, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # if 画像を選んだら
  
      # file_name = File.open("public/user_images/#{file_name}", 'wb')
      # @user.portrait = file_name
    #  @user.save
    if @user.save
      log_in(@user)
      UserMailer.with(to: @user.email, name: @user.name).welcome.deliver_later
      redirect_to @user, notice: 'アカウントを登録しました。' 
    else
      render :new 
    end
      # UserMailer.with(user: @user).welcome_mail.deliver_later
      # NotificationMailer.send_when_signup(@user).deliver
  end

  def show
    @user = User.find(params[:id])
    # 画像を表示
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to current_user unless current_user?(@user)
  end


end
