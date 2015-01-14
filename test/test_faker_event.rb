require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerEvent < Test::Unit::TestCase

  def setup
    @tester = Faker::Event
  end
  
  def test_full_details_with_no_params
     hash = @tester.full_details
     assert_equal hash.keys, [:name,:support_email,:location,:start_date,:end_date]
  end

  def test_full_details_with_event_type
    hash = @tester.full_details(:upcoming)
    assert_equal hash.keys, [:name,:support_email,:location,:start_date,:end_date]
    hash[:start_date].to_date > Date.today
  end

  def test_event_start_date_is_upcoming
    assert @tester.start_date(:upcoming).to_date > Date.today
  end

  def test_event_start_date_is_in_the_past
    assert @tester.start_date(:in_the_past).to_date < Date.today
  end

  def test_event_end_date_to_be_after_start_date
    hash = @tester.full_details(:upcoming)
    range_end = DateTime.parse((hash[:start_date].to_date+6).to_s)
    assert hash[:end_date].to_date < range_end
  end
end