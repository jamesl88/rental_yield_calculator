FactoryGirl.define do

  factory :landlord do
    sequence(:email) {|n| "test-#{n}@example.com" }
    sequence(:phone_number) {|n| "0792124558#{n}" }
    postcode "SE1 9QQ"
    current_rent 1000
    property_price 200000
  end

end