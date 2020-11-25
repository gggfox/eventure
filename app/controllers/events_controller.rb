class EventsController < ApplicationController
    before_action :logged_in_user, only: [:index, :edit, :update, :destroy]

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

    def by_category
        query = params[:q]
        @category = query
        search = "SELECT * FROM events AS e
                        WHERE e.id IN (SELECT ce.event_id FROM categories_events AS ce
                        WHERE ce.category_id=(SELECT c.id FROM categories AS c
                        WHERE c.name='#{query}'))" 
        @events = Event.find_by_sql(search)
    end

    private
    def event_params
        params.require(:event).permit(:title, :location, :date, :desc, :price, :image_name, :category_ids => [])
    end

    def logged_in_user
      unless logged_in? 
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
