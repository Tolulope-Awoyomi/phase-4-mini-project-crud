class SpicesController < ApplicationController

    def index 
        spices = Spice.all 
        render json: spices, status: :ok
    end

    def create
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.update(spice_params)
            render json: spice, status: :ok
        else 
            render_error_message
        end
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        if spice
            spice.destroy
            head :no_content
        else 
            render_error_message
        end
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def render_error_message
        render json: { Error: "Spice not found" }, status: :not_found
    end

end
