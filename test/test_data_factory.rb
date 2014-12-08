require File.dirname(__FILE__) + '/test_helper.rb'

class TestDataFactory < Test::Unit::TestCase
	include DataFactory
	def setup
     #@tester = DataFactory.get_custom_fields
    end

    def test_data_factory_loads_mst_class_methods
    	tester = DataFactory.get_custom_fields
    	assert_equal tester[0]['type'],'MeetingCustomField'
    end

    def test_data_factory_returns_external_meeting_information
    	tester = DataFactory.default_external_meeting_information
    	assert_true tester.has_key? 'Company'
    end

    def test_data_facotry_load_ast_class_methods
    	tester = DataFactory.get_custom_fields
    	assert_true tester.has_key? 'app_dynamics'
    end

end