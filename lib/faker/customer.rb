module Faker
	class Customer < Base
		flexible :customer

    	class << self
    	  def first_name
    	    ::Name.parse(fetch('name.first_name'))
    	  end
	
    	  def last_name
    	  	::Name.parse(fetch('name.last_name'))
    	  end

    	  def company
    	  	::Company.parse(fetch('company.name'))
    	  end

        def job_title
          ::Name.parse(fetch('name.title'))
        end

        def email
          fetch('internet.safe_email')
        end

        def mobile_number
          ::PhoneNumber.parse(fetch('phone.cell_phone'))
        end

        def country
          ::Address.parse(fetch('address.country'))
        end

    	end
	end
end