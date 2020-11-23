class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
        @categories = Categorie.all
    end

    def create
        @event = Event.new(event_params)
        if @event.save
            redirect_to @event
        end
    end
    
    def edit
        @event = Event.find(params[:id])
        @categories = Categorie.all
    end

    def update
        @event = Event.find(params[:id])
        if @event.update(event_params)
            flash[:success] = "Event updated"
            redirect_to @event
        else
            render 'edit'
        end
    end

    private
    def event_params
        params.require(:event)
    end
end