require 'geocoder'
require 'pagy/extras/bootstrap'

class LocationsController < ApplicationController
  def index
    # @locations = Location.all.order(id: :desc)
    # @pagy, @locations = pagy(@locations, items: 20)
  end

  def new
    @location = Location.new
  end

  def create
    location = Location.new(location_params)
    location.save
    redirect_to root_path
  end

  def coordinates_address
    location = Geocoder.search([params[:lat], params[:lng]]).first
    render json: { address: location.address, status: 200 }
  end

  private

  def location_params
    params.require(:location).permit(:name, :sub_category_id, :address, :city, :street, :number, :postal_code, :city, :country, :data, images: [])
  end
end
