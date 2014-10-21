module Faker
	class Customer < Base
		flexible :customer

    	class << self
    	  def first_name
            Name.first_name
    	  end
	
    	  def last_name
    	  	Name.last_name
    	  end

    	  def company 
    	  	Company.name
    	  end

          def job_title
            Name.title
          end

          def email
            Internet.safe_email
          end
  
          def mobile_number
            Phone.cell_phone
          end
  
          def country
            Address.country
          end
  
    	end
	end
end