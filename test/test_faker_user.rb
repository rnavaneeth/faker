require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakeUser < Test::Unit::TestCase

  def setup
    @tester = Faker::User
    @user_regions = ['us', 'apac', 'emea', 'latin_america', 'europe']
    @user_roles = ['account_manager', 'executive', 'executive_admin', 'theatre_lead', 'meeting_manager', 'admin']
  end
  
  def test_first_name
    assert @tester.first_name.match(/(\w+\.? ?){2,3}/)
  end

  def test_last_name
    assert @tester.last_name.match(/(\w+\.? ?){2,3}/)
  end
  
  def test_company
    assert @tester.company.match(/[A-Z][a-z]+\.?/)
  end

   def test_user_role
   	role1 = @tester.user_role
   	role2 = @tester.user_role
    assert @user_roles.include?(role1)
    assert @user_roles.include?(role2)
  end

  def test_region
    region1 = @tester.region
    region2 = @tester.region
    assert @user_regions.include?(region1)
    assert @user_regions.include?(region2)
  end
end
