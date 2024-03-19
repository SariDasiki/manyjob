class UserMailer < ApplicationMailer
  
  def welcome
    @name = params[:name] 
    mail(to: params[:to], subject: "登録完了") 
  end

  def send_when_admin_reply(user, contact) 
    @user = user 
    @answer = contact.reply_text 
    mail to: user.email, subject: "ユーザー登録が完了しました。"
  end


end
