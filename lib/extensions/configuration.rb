require 'yaml'
module DataFactory
  module ConfigurationBase
    def load
      @app_path = ENV["APP_PATH"] || File.dirname(__FILE__)
      @event_name = ENV['EVENT'] || "event:sample"
      @config = {}
      puts "I am here: #{@app_path}"
      unless File.exists?(File.join(@app_path,'../../preset_configs/',"#{conf_file}"))
        puts("[DataFactory] Warning - Could not find #{conf_file} in preset_configs folder. Either place this or initialize")
        return @config
      end
      begin
        raw_config = File.read(File.join(@app_path,'../../preset_configs/',"#{conf_file}"))
        @config = YAML.load(raw_config)
      rescue
        puts("[DataFactory] Error - Could not load/parse #{conf_file} file")
      end
      return @config
    end

    def [](key)
      load if @config.nil?
      @config[key]
    end

    def []=(key,value)
      @config[key] = value
    end

    def all
      @config
    end

    def valid?
      load if @config.nil?
      !@config[:base_url].blank? && !@config[:account_name].blank? && !@config[:api_key].blank? && !@config[:shared_secret].blank?
    end

    def disabled?
      load if @config.nil?
      @config[:disabled] == true
    end

    protected

    def conf_file
      @conf_file ||= nil
    end
  end

  module Configuration
    extend ConfigurationBase

    private

     def self.conf_file
       conf_file = "#{@event_name.gsub(':','_')}.yml"
     end
  end
end