require 'yaml'
require_relative 'configuration'
require_relative 'mst_class_methods'
require_relative 'ast_class_methods'
module DataFactory
  ConfigFile = Configuration::load
  CustomFields = ConfigFile.has_key?('CustomField') ? ConfigFile['CustomField']: ConfigFile['KeyValue']
  puts "[DataFactory] Load successful"
  
  def self.included(base)
  	if ConfigFile.has_key? 'CustomField'
  		DataFactory.extend(MSTClassMethods)
  	else
  		DataFactory.extend(ASTClassMethods)
  	end
  end
end