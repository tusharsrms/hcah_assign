class User < ActiveRecord::Base

#===========================================Validations===================================================#
  # validating the first_name
  # presence
  validates :first_name, presence: true

  # validating the Address1
  # presence
  # restrict length
  validates :address1, presence: true, length: { maximum: 60 }

  # validating the Address2
  # presence
  # restrict length
  validates :address2, presence: true, length: { maximum: 60 }

  # validating the city
  # presence
  # restrict length
  validates :city, presence: true

  # validating the state
  # presence
  # restrict length
  validates :state, presence: true

  # validating the zipcode
  # numbers only
  # no. of digits(5-6)
  validates :zipcode, numericality: true, length: { minimum: 5, maximum: 6 }, format: { with: /[0-9]+/ }


  # validating the signature
  # uniqueness validation
  validates :signature, uniqueness: true, presence: true
 #==============================================End========================================================#

  # Get user's fullname
  def fullname
    "#{first_name} #{last_name}"
  end
end
