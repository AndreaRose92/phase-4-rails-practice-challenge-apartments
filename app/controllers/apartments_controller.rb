class ApartmentsController < ApplicationController

    def index
        render json: Apartment.all
    end

    def show
        render json: find_apt
    end

    def create
        render json: Apartment.create!(apt_params), status: :created
    end

    def update
        render json: find_apt.update!(apt_params), status: :ok
    end

    def destroy
        find_apt.destroy
        head :no_content
    end

    private

    def find_apt
        Apartment.find(params[:id])
    end

    def apt_params
        params.permit(:number)
    end

end
