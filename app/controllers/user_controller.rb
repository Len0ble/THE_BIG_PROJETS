class UserController < ApplicationController
  before_action :require_login, only: [:profile]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      cookies[:user_id] = { value: @user.id, expires: 1.hour.from_now }
      redirect_to profile_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def login
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      cookies[:user_id] = { value: user.id, expires: 1.hour.from_now }
      redirect_to profile_path
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'login_form'
    end
  end

  def destroy
    log_out
    cookies.delete(:user_id)
    redirect_to login_path
  end

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:prenom, :nom, :description, :email, :age, :city_id, :password, :password_confirmation)
  end

  def require_login
    unless logged_in?
      flash[:danger] = "Veuillez vous connecter."
      redirect_to login_path
    end
  end
end
