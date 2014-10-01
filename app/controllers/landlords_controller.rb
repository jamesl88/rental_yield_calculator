class LandlordsController < ApplicationController

  def index
    @landlords = Landlord.all
  end

  def create
    @landlord = Landlord.new(landlord_params)
    @landlord.save ? landlord_saved : landlord_not_saved
  end

  def new
    @landlord = Landlord.new
  end

  private

    def landlord_params
      params.require(:landlord).permit(:email, :phone_number, :postcode, :current_rent, :property_price)
    end

    def landlord_not_saved
      redirect_to landlords_path, alert: "Landlord not saved."
    end

    def landlord_saved
      redirect_to landlords_path, notice: "New Landlord has been added."
    end

end
