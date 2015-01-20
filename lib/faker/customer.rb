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
            PhoneNumber.cell_phone
          end
  
          def country
            Address.country
          end

          def full_details(options={})
            email_id = options.has_key?(:domain) ? email.gsub(/@.+/,"@#{options[:domain]}") : email
            h = { first_name: first_name, last_name: last_name, company: company, job_title: job_title, 
                  email: email_id, mobile_number: mobile_number, country: country}
            h
          end
  
    	end
	end
end