class AnimalSightingsController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @sightings = AnimalSighting.where(date: params[:start_date]..params[:end_date])
        # @sightings = AnimalSighting.all
        render json: @sightings
    end

    def show
        @animal_sightings = AnimalSighting.find(params[:id])
        render json: @animal_sightings
    end

    def create 
        @animal_sightings = AnimalSighting.new(animal_sightings_params)

        if @animal_sightings.save
            render json: @animal_sightings, status: 201
        else
            render json: @animal_sightings.errors, status:422
        end
    end

    def destroy
        @animal_sightings = AnimalSighting.find(params[:id])

        if @animal_sightings && @animal_sightings.destroy
            render json: @animal_sightings, status: 200
        else
            render json: { errors: "Could not destroy quitar" }, status: 400
        end
    end

    def update
        @animal_sightings = AnimalSighting.find(params[:id])

        if @animal_sightings.update(animal_sightings_params)
            render json: @animal_sightings, status: 200
        else
            render json: @animal_sightings.errors, status: :unprocessable_entity
        end
    end

    private # this strong parameters will require an animal object
    
    def animal_sightings_params
        params.require(:animal_sighting).permit(:date, :latitude, :longitude, :animal_id)
    end

end
