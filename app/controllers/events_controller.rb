class EventsController < ApplicationController

  # def like
  #   @event = Event.find(params[:id])
  #   @event.liked_by(current_user)
  #   redirect_to event_show_path
  # end
  def index
    @event = Event.all
  end

  def new
    @organization = Organization.find(params[:organization_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organization = Organization.find(params[:organization_id])
    @event.save
      redirect_to dashboard_path
  end

  def edit
    @organization = Organization.find(params[:organization_id])
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to dashboard_path
  end

  def show
    @organization = Organization.find(params[:organization_id])
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :content, :date, :venue)
  end


end



