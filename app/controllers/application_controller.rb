class ApplicationController < ActionController::Base
  before_action :only_signed_in, :only_signed_out
  add_flash_types :success, :danger
#helper pour être accessible au niveau de nos vues
  helper_method :current_user, :user_signed_in?

  private

  def only_signed_in
    if !user_signed_in?
      redirect_to new_user_path, danger: "You don't have the right to access this page"
    end
  end

  def only_signed_out
    redirect_to profil_path(current_user) if user_signed_in?
  end

#juste pour mettre en occurence le nom user signed in
  def user_signed_in?
    !current_user.nil?
  end

#retourne l'utilisateur actuellement connecté
  def current_user
    return nil if !session[:auth] || !session[:auth]['id']
    return @user_logged if @user_logged
    @user_logged = User.find_by_id(session[:auth]['id'])
  end
end
