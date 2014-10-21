require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakeMeeting < Test::Unit::TestCase

  def setup
    @tester = Faker::Meeting
    @meeting_types =['partner', 'customer', 'ar_or_pr', 'internal', 'other']
  end
  
  def test_company
    assert @tester.company.match(/(\w+\.? ?){2,3}/)
  end

  def test_meeting_type
    assert @meeting_types.include?@tester.meeting_type
  end
  
  def test_custom_text_fields
    assert(@tester.custom_text_fields.length==3)
  end

  def test_custom_textarea_fields
    assert(@tester.custom_textarea_fields.length==3)
  end
end