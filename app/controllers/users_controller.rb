class UsersController < ApplicationController

  skip_before_action :only_signed_in, only: [:new, :create]
  before_action :only_signed_out, only: [:new, :create]

  def index
    @user= current_user
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
      redirect_to profil_path(@user), success: "Your account has been successfully created"
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

    if user_params[:picture].nil?
      # L'image n'a pas été fournie, donc aucune modification n'est nécessaire
      user_params.delete(:picture) # Supprimez le paramètre picture du hash user_params
    end

    if @user.update(user_params)
      if user_params[:picture].present?
      # @user.picture.attach(params[:user][:picture])
      end
      redirect_to profil_path(@user), success: "your account has been successfully modified"
      else
        render :edit
    end

  end

end
