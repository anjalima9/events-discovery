class EventsController < ApplicationController

  skip_before_action :only_signed_out, only: [:index, :new, :edit, :show, :update, :create, :destroy, :search]
  before_action :set_event, only: [:update, :edit, :show, :destroy]

  def new
    @event = Event.new
  end

  def index
    @events = Event.where.not(user_id: current_user.id)
  end

  def edit
  end

  def show
  end

  def update
      if @event.update(event_params)
        image_check_n_save "update"
        redirect_to profil_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
       # Vérifier si une image a été téléchargée
      image_check_n_save
      redirect_to profil_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

def search
@events = Event.where("title LIKE ?", "%" + params[:query] + "%")
render :index
end

  def destroy
    # Supprimer l'image associée à l'événement s'il en existe une
    @event.background_image.purge if @event.background_image.attached?
    @event.destroy
    redirect_to events_path
  end


  private

   def event_params
    return params.require(:event).permit(:title, :description, :date, :heure, :lieu).merge({user_id: session[:auth]['id']}) if session[:auth] || session[:auth]['id']
    return nil
   end

   def set_event
    @event = Event.find(params[:id])
   end

   def image_check_n_save(action = nil)
    if params[:event][:background_image].present?
      if action === "update"
        @event.background_image.purge if @event.background_image.attached?
      end
      @event.background_image.attach(params[:event][:background_image])
    end
   end
end
