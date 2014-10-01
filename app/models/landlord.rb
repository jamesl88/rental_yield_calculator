class Landlord < ActiveRecord::Base
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :phone_number, presence: true, uniqueness: { case_sensitive: false }
end
