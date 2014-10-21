module Faker
	class Customer < Base
		flexible :customer

    	class << self
    	  def first_name
    	    Faker::Name.parse(fetch('name.first_name'))
    	  end
	
    	  def last_name
    	  	Faker::Name.parse(fetch('name.last_name'))
    	  end

    	  def company
    	  	Faker::Company.parse(fetch('company.name'))
    	  end

        def job_title
          Faker::Name.parse(fetch('name.title'))
        end

        def email
          fetch('internet.safe_email')
        end

        def mobile_number
          Faker::PhoneNumber.parse(fetch('phone.cell_phone'))
        end

        def country
          Faker::Address.parse(fetch('address.country'))
        end

    	end
	end
end