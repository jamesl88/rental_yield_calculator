require "rails_helper"

describe LandlordsController do

  let(:pre_saved_landlord) { FactoryGirl.build :landlord }
  let(:post_saved_landlord) { FactoryGirl.create :landlord }

  describe "GET index" do
    it "assigns @landlords" do
      get :index
      expect(assigns(:landlords)).to eq Landlord.all
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end # END GET index

  describe "GET edit" do
    it "renders the edit template" do
      get :edit, id: post_saved_landlord
      expect(response).to render_template("edit")
    end
  end # END GET edit

  describe "POST create" do

    context "Successful" do
      before { post :create, landlord: pre_saved_landlord.attributes }

      it { should respond_with 302 }
      it { should permit(:email, :phone_number, :postcode, :current_rent, :property_price, :yearly_yield, :net_yield, :maintenance_expenses).for(:create) }
      it { should set_the_flash[:notice].to("New Landlord has been added.") }
      it { should redirect_to landlords_path }

      it "creates a new landlord record" do
        expect{ post :create, landlord: FactoryGirl.build(:landlord).attributes }.
          to change(Landlord, :count).by(1)
      end
    end

    context "Failed" do
      before { post :create, landlord: post_saved_landlord.attributes }

      it { should redirect_to landlords_path }
      it { should set_the_flash[:alert].to("Email has already been taken and Phone number has already been taken") }

      it "does not create a new landlord record" do
        expect{ post :create, landlord: post_saved_landlord.attributes }.
          to_not change(Landlord, :count)
      end
    end
  end # END POST create

  describe "GET new" do

    it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end # END GET new

  describe "PUT update" do 
    context "Successful" do 
      before { 
        put :update, 
        id: post_saved_landlord.id, 
        landlord: post_saved_landlord.attributes = { email: "new-email@example.com" } 
      }

      it { should respond_with 302 }
      it { should set_the_flash[:notice].to("Landlord has been updated.") }
      it { should redirect_to landlords_path }

    end

    context "Failed" do 
      before { 
        @new_landlord = FactoryGirl.create :landlord
        put :update, 
        id: @new_landlord, 
        landlord: post_saved_landlord.attributes = { email: post_saved_landlord.email } 
      }

      it { should respond_with 302 }
      it { should set_the_flash[:alert].to("Email has already been taken") }
      it { should redirect_to landlords_path }
    end
  end # END PUT update


end
