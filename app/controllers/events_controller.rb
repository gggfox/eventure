class EventsController < ApplicationController

    def index
        @events = Event.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
        @categories = Category.all
    end

    def create
        @event = Event.new(event_params)
        @categories = Category.all
        if @event.save
            redirect_to events_url
        end
    end
    
    def edit
        @event = Event.find(params[:id])
        @categories = Category.all
    end

    def update
        @event = Event.find(params[:id])
        p @event.date
        if @event.update(event_params)
            flash[:success] = "Event updated"
            redirect_to events_url
        else
            render 'edit'
        end
    end

    def destroy
        Event.find(params[:id]).destroy
        flash[:success] = "Event deleted"
        redirect_to events_url
    end

    def attend
        @event = Event.find(params[:format])
        if !current_user.events.include?(@event)
            current_user.events.push(@event)
        else
            flash[:danger] = "already attending to that event"
        end
        redirect_to request.referrer
        
        
    end

    def unattend
        @event = Event.find(params[:format])
        current_user.events.delete(@event)
        redirect_to request.referrer
    end

    private
    def event_params
        params.require(:event).permit(:title, :location, :date, :desc, :price, :image_name, :category_ids => [])
    end
end