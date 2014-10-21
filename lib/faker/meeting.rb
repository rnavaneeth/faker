module Faker
	class Meeting < Base
		flexible :meeting
		MEETING_TYPES=[:partner, :customer, :ar_or_pr, :internal, :other]

    	class << self
    	  def company
	       Company.name
    	  end
	
    	  def meeting_type(*types)
    	  	types = MEETING_TYPES if types.empty?
    	  	types.sample.to_s
    	  end

    	  def custom_text_fields
    	  	Lorem.words
    	  end

    	  def custom_textarea_fields
    	  	Lorem.sentences
    	  end
    	end
	end
end