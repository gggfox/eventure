class CategoriesController < ApplicationController

    def index
        @categories = Categorie.all
    end

    def new
        @categorie = Categorie.new
    end

    def create
        @categorie = Categorie.new(categorie_params)
        if @categorie.save
            redirect_to action: "index"
        end
    end

    private
    def categorie_params
        params.require(:categorie).permit(:name)
    end
end