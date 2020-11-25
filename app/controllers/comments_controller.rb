class CommentsController < ApplicationController

    def new
        @comment = Comment.new
    end

    def create
        @comment = Comment.new(comment_params)
        p @comment
        if @comment.save
            redirect_to event_url(@comment.event_id)
        end
    end

    def edit
        @comment = Comment.find(params[:id])
        @event = Event.find(@comment.event_id)
        @user = User.find(@comment.user_id)
    end

    def update
        @comment = Comment.find(params[:id])
        if @comment.update(comment_params)
            flash[:success] = "Comment updated"
        end
                    redirect_to events_path

    end

    def destroy
        Comment.find(params[:id]).destroy
        flash[:success] = "Comment deleted"
        redirect_to request.referrer
    end

    private
    def comment_params
        params.require(:comment).permit(:event_id,:user_id,:comment)
    end
end
