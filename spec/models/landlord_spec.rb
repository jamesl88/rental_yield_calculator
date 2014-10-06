require 'rails_helper'

describe Landlord do
  describe "database schema" do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:phone_number).of_type(:string) }
    it { should have_db_column(:postcode).of_type(:string) }
    it { should have_db_column(:current_rent).of_type(:integer) }
    it { should have_db_column(:property_price).of_type(:integer) }
    it { should have_db_column(:yearly_yield).of_type(:integer) }

  end # END SCHEMA DESCRIPTION

  describe "validations" do
    context "email" do
      it { should allow_value("example@example.com").for(:email) }
    end

    context "phone_number" do
      it { should allow_value("079123456789").for(:phone_number) }
    end
  end # END VALIDATIONS
end
