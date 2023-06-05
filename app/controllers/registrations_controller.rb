class RegistrationsController < ApplicationController

  skip_before_action :only_signed_out, only: [:new, :create]
  def new
    @event_id = params[:id_event]
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

  # Manipulation des attributs virtuels
  firstname = params[:registration][:firstname]
  lastname = params[:registration][:lastname]

  # Utilisation des attributs virtuels
  if firstname.present? && lastname.present?
    full_name = "#{firstname} #{lastname}"
  end

  if @registration.valid?
    @registration.save
      # Gérer le succès de la création de l'enregistrement
      redirect_to event_path(@registration.event, full_name: full_name), success: "#{full_name} you are now registered for the event!"
    else
      # Gérer les erreurs de validation et afficher les messages appropriés
      render :new
    end
  end


  private

  def registration_params
    params.require(:registration).permit(:id_event, :id_user, :email, :firstname, :lastname)
  end


end
