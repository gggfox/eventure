class CategoriesController < ApplicationController

    def index
        @categories = Category.all
    end

    def new
        @categorie = Category.new
    end

    def create
        @categorie = Category.new(categorie_params)
        if @categorie.save
            redirect_to action: "index"
        end
    end

    private
    def categorie_params
        params.require(:category).permit(:name)
    end
end
