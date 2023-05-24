class EventsController < ApplicationController

  before_action :set_event, only: [:update, :edit, :show, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def show
  end

  def update
      if @event.update(event_params)
        image_check_n_save "update"
        redirect_to events_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def create
    @event = Event.new(event_params)

    if @event.save
       # Vérifier si une image a été téléchargée
      image_check_n_save
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    # Supprimer l'image associée à l'événement s'il en existe une
    @event.background_image.purge if @event.background_image.attached?
    @event.destroy
    redirect_to events_path
  end


  private

   def event_params
    params.require(:event).permit(:title, :description, :date, :heure, :lieu)
   end

   def set_event
    @event = Event.find(params[:id])
   end

   def image_check_n_save(action = nil)
    if params[:event][:background_image].present?
      if action === "update"
        @event.background_image.purge if @event.background_image.attached?
        @event.background_image.attach(params[:event][:background_image])
      else
        @event.background_image.attach(params[:event][:background_image])
      end
    end
   end

end
