require File.expand_path(File.dirname(__FILE__) + '/test_helper.rb')

class TestFakerCustomer < Test::Unit::TestCase

  def setup
    @tester = Faker::Customer
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

  def test_jobtite
    assert @tester.job_title.match(/[A-Z][a-z]+\.?/)
  end

  def test_email
    assert @tester.email.match(/.+@jifflenow.net/)
  end

  def test_country
    assert @tester.country.match(/[A-Z][a-z]+\.?/)
  end

  def phone_number
    assert @tester.phone_number.match(/d+/)
  end

  def test_full_details_with_options
    hash = @tester.full_details(domain: 'company.com')
    assert_equal hash.keys, [:first_name,:last_name,:company,:job_title,:email,:mobile_number,:country]
    assert hash[:email].match(/.+@company.com/)
  end

  def test_full_details_with_no_params
     hash = @tester.full_details
    assert_equal hash.keys, [:first_name,:last_name,:company,:job_title,:email,:mobile_number,:country]
  end
end