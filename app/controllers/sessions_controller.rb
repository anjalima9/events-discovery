class SessionsController < ApplicationController

skip_before_action :only_signed_in, only: [:new, :create]
before_action :only_signed_out, only: [:new, :create]

  def new
  end

  def create
    user_params = params.require(:user)
    @user = User.find_by(email: user_params[:email])

    if @user.nil?
      redirect_to new_session_path, danger: "Utilisateur introuvable"
      return
    end

    unless @user.authenticate(user_params[:password])
      redirect_to new_session_path, danger: "Mot de passe incorrect"
      return
    end

    session[:auth] = @user.to_session
    redirect_to profil_path(@user)
  end


  def destroy
    session.destroy
    redirect_to new_session_path
  end
end
