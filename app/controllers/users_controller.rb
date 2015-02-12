class UsersController < ApplicationController
  before_action :require_admin, only: [:index, :make_admin]

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def make_admin
    @user = User.find(params[:id])
    unless @user == current_user
      @user.toggle(:admin)
      @user.save!
    end

    redirect_to users_url
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
