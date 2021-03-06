class LandlordsController < ApplicationController

  helper_method :sort_column, :sort_direction

  def index
    @landlords = Landlord.order(sort_column + " " + sort_direction).paginate(per_page: 10, page: params[:page])
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
      params.require(:landlord).permit(:email, :phone_number, :postcode, :current_rent, :property_price, :yearly_yield, :net_yield, :maintenance_expenses)
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

    def sort_column
      Landlord.column_names.include?(params[:sort]) ? params[:sort] : "email"         
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"      
    end

end
