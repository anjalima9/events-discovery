class RegistrationsController < ApplicationController

  skip_before_action :only_signed_out, only: [:new, :create]
  def new
    @event_id = params[:id_event]
    @registration = Registration.new
  end

  def create
    @registration = Registration.new(registration_params)

  if @registration.valid?
    @registration.save
      # Gérer le succès de la création de l'enregistrement
      redirect_to event_path(@registration.event), success: "vous êtes maintenant inscrits à l'évènement"
    else
      # Gérer les erreurs de validation et afficher les messages appropriés
      render :new
    end
  end

#  redirect_to @registration, notice: "Registration was successfully created."


  private

  def registration_params
    params.require(:registration).permit(:id_event, :id_user)
  end


end
