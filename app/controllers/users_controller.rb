class UsersController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create]
  before_action :only_signed_out, only: [:new, :create]

  def index
    @user= User.includes(:event).find_by_id(session[:auth]['id'])
  end

  def new
    @user = User.new
  end

  def create
    user_params = params.require(:user).permit(:username, :email, :firstname, :lastname, :password, :password_confirmation)
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:auth] = @user.to_session
      redirect_to profil_path, success: "Your account has been successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    user_params = params.require(:user).permit(:username, :email, :firstname, :lastname, :picture)
    if @user.update(user_params)
      @user.picture.attach(params[:user][:picture])
      redirect_to profil_path, success: "your account has been successfully modified"
      else
        render :edit
    end

  end

end
