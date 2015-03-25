require 'yaml'
module DataFactory
  module ConfigurationBase
    def load
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
    def self.set_app_path(path)
        @app_path= path
        puts "[DataFactory] Reset App Path to #{@app_path}"
    end
    @event_name = ENV['EVENT'] || "event:sample"
    @config = {}
    @app_path = File.dirname(__FILE__)
    puts "[DataFactory] Initializing Configuration with Path #{@app_path}"

    private

     def self.conf_file
       conf_file = "#{@event_name.gsub(':','_')}.yml" || 'event_sample.yml'
     end
  end
end