class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to events_url
        end
    end

    def show
        @category = Category.find(params[:id])
        @comment  = Comment.new
    end

    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            flash[:success] = "Category updated"
            redirect_to events_url
        else
            render 'edit'
        end
    end

    def destroy
        Category.find(params[:id]).destroy
        flash[:success] = "Category deleted"
        redirect_to events_url
    end

    private
    def category_params
        params.require(:category).permit(:name)
    end
end
