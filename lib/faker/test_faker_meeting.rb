require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMeeting < Test::Unit::TestCase

  def setup
    @tester = Faker::Meeting
    @meeting_types = [partner, customer, ar_or_pr, internal, other]
  end
  
  def test_company_name
    assert @tester.company_name.match(/[A-Z][a-z]+\.?/)
  end

  def test_meeting_type
     type = @tester.meeting_type.
     assert @meeting_types.include?(type)
  
  
end