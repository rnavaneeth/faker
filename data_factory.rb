require 'yaml'
require 'faker'
require_relative 'configuration'
module DataFactory
#attr_accessor :custom_fields
$config_file = ENV['CONFIG_FILE'] || "symantec_config.yml"
	config = Configuration::load
	Custom_fields = config['CustomField']
	Event_Start_Date = config['Account']['start_date']
	puts "[DataFactory] Config file #{$config_file} found. Load successful"
	
	def self.get_custom_fields
		Custom_fields.select{|x| x['type']=='MeetingCustomField'}
	end

	def self.get_external_custom_fields
		Custom_fields.select{ |x| x['type']=='ExternalMeetingCustomField'}
	end

	def self.get_quick_meeting_custom_fields
		Custom_fields.select{ |x| x['type']=='QuickMeetingMeetingCustomField'}
	end

	def self.get_customer_custom_fields
		Custom_fields.select{ |x| x['type']=='CustomerCustomField'}
	end

	def self.get_user_custom_fields
		Custom_fields.select{ |x| x['type']=='UserCustomField'}
	end

	def self.default_meeting_information
		meeting_fields = get_custom_fields
		meeting_info = Hash.new
		meeting_fields.select{ |field| field['data_type']=='Text' }.each do |field|
			meeting_info.merge!(field['display_name'] => Faker::Meeting.custom_textarea_fields.join(' '))
		end
		meeting_fields.select{ |field| field['data_type']=='String'}.each do |field|
			meeting_info.merge!(field['display_name'] => Faker::Meeting.custom_text_fields.join(' '))
		end
		meeting_fields.select{ |field| field['data_type']=='List'}.each do |field|
			meeting_info.merge!(field['display_name'] => field['options'][:value_list][0])
		end
		meeting_info.merge!("Company Name" => Faker::Company.name)
		meeting_info.merge!("Meeting Requestor" => "I am the requestor")
		meeting_info.merge!("Host Attendance" => "Yes")
		meeting_info
	end

	def self.default_external_meeting_information
		meeting_fields = get_external_custom_fields
		meeting_info =
		{ 	'First Name' => Faker::Customer.first_name,
			'Last Name' => Faker::Customer.last_name,
			'Email' => Faker::Customer.email,
			'Mobile' => Faker::Customer.mobile_number,
			'Title' => Faker::Customer.job_title,
			'Company' => Faker::Customer.company,
			'Country' => Faker::Customer.country,
			'Topic' => 'Customer',
			'Executive' => 'AutoUser Outlook2007',
			'Preferred Date and Time' => "#{Event_Start_Date.to_s},10:00 AM",
			'Preferred Duration' => '30 mins',
			'Alternate Date and Time' => "#{Event_Start_Date.to_s},11:00 AM",
			'Alternate Duration' => '30 mins',
		}

		meeting_fields.select{ |field| field['data_type']=='Text' }.each do |field|
			meeting_info.merge!(field['display_name'] => Faker::Meeting.custom_textarea_fields)
		end
		meeting_fields.select{ |field| field['data_type']=='String'}.each do |field|
			meeting_info.merge!(field['display_name'] => Faker::Meeting.custom_text_fields)
		end
		meeting_fields.select{ |field| field['data_type']=='List'}.each do |field|
			meeting_info.merge!(field['display_name'] => field['options'][:value_list][0])
		end
		puts "Full Hash: #{meeting_info}"
		meeting_info
end

def self.default_customer_information
		customer_fields = get_customer_custom_fields
		customer_info =
		{ 	'Customer First Name' => Faker::Customer.first_name,
			'Customer Last Name' => Faker::Customer.last_name,
			'Customer Title' => Faker::Customer.job_title,
			'Customer Email' => Faker::Customer.safe_email,
			'Customer Mobile' => Faker::Customer.mobile_number,
			'Customer Company' => Faker::Customer.company,
			'Customer Country' => Faker::Customer.country,
		}
		customer_info
	end

	def self.default_user_information
		user_fields = get_user_custom_fields
		user_info =
		{ 	'User First Name' => Faker::User.first_name,
			'User Last Name' => Faker::User.last_name,
			'User Company' => Faker::User.company,
			'User Title' => Faker::User.job_title,
			'User Email' => Faker::User.safe_email,
			'User Role' => Faker::User.user_role,
			'User Role Sub type' => 'engineer',
		}
		user_info
	end
end