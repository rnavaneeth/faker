module Faker
  class Event < Base
	flexible :event
	class << self
	  def name
	  	name = "#{Hacker.abbreviation} #{Time.year(:upcoming)}"
	  end

	  def support_email
	  	support_email = Internet.safe_email
	  end

	  def location
	  	location = Address.city
	  end

	  def start_date(option=nil)
	  	days_differential = (50..300).to_a.sample
	  	event_range = (2..5).to_a.sample
	  	start_date = nil
	    if option.eql? :upcoming
	  	  start_date = Time.forward(days_differential)
	    elsif option.eql? :in_the_past
	      start_date = Time.backward(days_differential)
	    else
	      start_date = Time.between(Time.forward(200),Time.backward(200))	
	  	end
	  	@end_date = (start_date.to_date+event_range).to_s
	  	start_date
	  end

	  def end_date
	  	DateTime.parse(@end_date)
	  end

      def full_details(option=nil)
        event_hash =
        { :name => name,
        :support_email => support_email,
        :location => location,
        :start_date => start_date(option),
        :end_date => end_date}
        event_hash
      end
  	end
  end
end