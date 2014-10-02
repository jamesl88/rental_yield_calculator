class LandlordsController < ApplicationController

  def index
    @landlords = Landlord.all
  end

  def edit
    @landlord = Landlord.find(params[:id])
  end

  def create
    @landlord = Landlord.new(landlord_params)
    @landlord.save ? landlord_saved : landlord_not_saved
  end

  def new
    @landlord = Landlord.new
  end

  def update
    @landlord = Landlord.find(params[:id])
    @landlord.update_attributes(landlord_params)
    @landlord.save ? landlord_updated : landlord_not_saved
  end

  private

    def landlord_params
      params.require(:landlord).permit(:email, :phone_number, :postcode, :current_rent, :property_price)
    end

    def landlord_updated
      redirect_to landlords_path, notice: "Landlord has been updated."
    end

    def landlord_not_saved
      redirect_to landlords_path, alert: @landlord.errors.full_messages.to_sentence
    end

    def landlord_saved
      redirect_to landlords_path, notice: "New Landlord has been added."
    end

end
