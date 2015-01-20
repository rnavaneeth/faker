require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerMeeting < Test::Unit::TestCase

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
  
  def test_custom_textarea_fields
    cf1 = @tester.custom_textarea_fields
    cf2 = @tester.custom_textarea_fields

    assert cf1.match(/(\w+\.? ?){3}/)
    assert cf2.match(/(\w+\.? ?){3}/)
  end

  def test_custom_text_fields
    c1 = @tester.custom_text_fields
    c2 = @tester.custom_text_fields
    assert c1.match(/(\w+\.? ?){3}/)
    assert c2.match(/(\w+\.? ?){3}/)
  end
end