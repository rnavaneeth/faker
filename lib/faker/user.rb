module Faker
	class User < Base
		flexible :user
		USER_ROLES=[:account_manager, :executive, :executive_admin, :theatre_lead, :meeting_manager, :admin ]
        REGION = [:us, :apac, :emea, :latin_america, :europe]

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

          def user_role
            roles = USER_ROLES if roles.empty?
            roles.sample.to_s
          end

          def region
            regions = REGION if regions.empty?
            regions.sample.to_s
          end
    	end
	end
end