class AnimalsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        @animals = Animal.all
        render json: @animals
    end

    def show
        @animal = Animal.find(params[:id])
        render json: @animal
    end

    def create 
        @animal = Animal.new(animal_params)

        if @animal.save
            render json: @animal, status: 201
        else
            render json: @animal.errors, status:422
        end
    end

    def destroy
        @animal = Animal.find(params[:id])

        if @animal && @animal.destroy
            render json: @animal, status: 200
        else
            render json: { errors: "Could not destroy quitar" }, status: 400
        end
    end

    def update
        @animal = Animal.find(params[:id])

        if @animal.update(animal_params)
            render json: @animal, status: 200
        else
            render json: @animal.errors, status: :unprocessable_entity
        end
    end

    private # this strong parameters will require an animal object
    
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :animal_class)
    end
end
