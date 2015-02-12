class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      msg = UserMailer.activation_email(@user)
      msg.deliver
      redirect_to new_session_url
    else
      render :new
    end
  end

  def show
    render :show
  end

  def activate
    token = params[:activation_token]
    @user = User.find_by(activation_token: token)
    if @user && !@user.activated
      @user.toggle(:activated)
      @user.save!
      redirect_to new_session_url
    else
      render text: "not a valid token", status: :not_found
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
