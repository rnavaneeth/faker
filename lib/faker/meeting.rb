module Faker
	class Meeting < Base
		flexible :meeting
		MEETING_TYPES=[:partner, :customer, :ar_or_pr, :internal, :other]

    	class << self
    	  def company
    	    fetch('company.name')
    	  end
	
    	  def meeting_type(*types)
    	  	types = MEETING_TYPES if types.empty?
    	  	types.sample.to_s
    	  end

    	  def custom_text_fields
    	  	fetch('lorem.words')
    	  end

    	  def custom_textarea_fields
    	  	fetch('lorem.sentences')
    	  end
    	end
	end
end