class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      NotifyMailer.send_mail(@user).deliver
      redirect_to root_url, notice: "An email sent to #{@user.email}."
    else
      flash[:error] = "Error sending email."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end