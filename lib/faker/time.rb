module Faker
  class Time < Date
    TIME_RANGES = {
      :all => (0..23),
      :day => (9..17),
      :night => (18..23),
      :morning => (6..11),
      :afternoon => (12..17),
      :evening => (17..21),
      :midnight => (0..4)
    }
    ZONES = { "International Date Line West" => "Pacific/Midway", "Midway Island" => "Pacific/Midway", "Samoa" => "Pacific/Pago_Pago", "Hawaii" => "Pacific/Honolulu", "Alaska" => "America/Juneau", "Pacific Time (US & Canada)" => "America/Los_Angeles", "Tijuana" => "America/Tijuana", "Mountain Time (US & Canada)" => "America/Denver", "Arizona" => "America/Phoenix", "Chihuahua" => "America/Chihuahua", "Mazatlan" => "America/Mazatlan", "Central Time (US & Canada)" => "America/Chicago", "Saskatchewan" => "America/Regina", "Guadalajara" => "America/Mexico_City", "Mexico City" => "America/Mexico_City", "Monterrey" => "America/Monterrey", "Central America" => "America/Guatemala", "Eastern Time (US & Canada)" => "America/New_York", "Indiana (East)" => "America/Indiana/Indianapolis", "Bogota" => "America/Bogota", "Lima" => "America/Lima", "Quito" => "America/Lima", "Atlantic Time (Canada)" => "America/Halifax", "Caracas" => "America/Caracas", "La Paz" => "America/La_Paz", "Santiago" => "America/Santiago", "Newfoundland" => "America/St_Johns", "Brasilia" => "America/Argentina/Buenos_Aires", "Buenos Aires" => "America/Argentina/Buenos_Aires", "Georgetown" => "America/Argentina/San_Juan", "Greenland" => "America/Godthab", "Mid-Atlantic" => "Atlantic/South_Georgia", "Azores" => "Atlantic/Azores", "Cape Verde Is." => "Atlantic/Cape_Verde", "Dublin" => "Europe/Dublin", "Edinburgh" => "Europe/Dublin", "Lisbon" => "Europe/Lisbon", "London" => "Europe/London", "Casablanca" => "Africa/Casablanca", "Monrovia" => "Africa/Monrovia", "UTC" => "Etc/UTC", "Belgrade" => "Europe/Belgrade", "Bratislava" => "Europe/Bratislava", "Budapest" => "Europe/Budapest", "Ljubljana" => "Europe/Ljubljana", "Prague" => "Europe/Prague", "Sarajevo" => "Europe/Sarajevo", "Skopje" => "Europe/Skopje", "Warsaw" => "Europe/Warsaw", "Zagreb" => "Europe/Zagreb", "Brussels" => "Europe/Brussels", "Copenhagen" => "Europe/Copenhagen", "Madrid" => "Europe/Madrid", "Paris" => "Europe/Paris", "Amsterdam" => "Europe/Amsterdam", "Berlin" => "Europe/Berlin", "Bern" => "Europe/Berlin", "Rome" => "Europe/Rome", "Stockholm" => "Europe/Stockholm", "Vienna" => "Europe/Vienna", "West Central Africa" => "Africa/Algiers", "Bucharest" => "Europe/Bucharest", "Cairo" => "Africa/Cairo", "Helsinki" => "Europe/Helsinki", "Kyev" => "Europe/Kiev", "Riga" => "Europe/Riga", "Sofia" => "Europe/Sofia", "Tallinn" => "Europe/Tallinn", "Vilnius" => "Europe/Vilnius", "Athens" => "Europe/Athens", "Istanbul" => "Europe/Istanbul", "Minsk" => "Europe/Minsk", "Jerusalem" => "Asia/Jerusalem", "Harare" => "Africa/Harare", "Pretoria" => "Africa/Johannesburg", "Moscow" => "Europe/Moscow", "St. Petersburg" => "Europe/Moscow", "Volgograd" => "Europe/Moscow", "Kuwait" => "Asia/Kuwait", "Riyadh" => "Asia/Riyadh", "Nairobi" => "Africa/Nairobi", "Baghdad" => "Asia/Baghdad", "Tehran" => "Asia/Tehran", "Abu Dhabi" => "Asia/Muscat", "Muscat" => "Asia/Muscat", "Baku" => "Asia/Baku", "Tbilisi" => "Asia/Tbilisi", "Yerevan" => "Asia/Yerevan", "Kabul" => "Asia/Kabul", "Ekaterinburg" => "Asia/Yekaterinburg", "Islamabad" => "Asia/Karachi", "Karachi" => "Asia/Karachi", "Tashkent" => "Asia/Tashkent", "Chennai" => "Asia/Kolkata", "Kolkata" => "Asia/Kolkata", "Mumbai" => "Asia/Kolkata", "New Delhi" => "Asia/Kolkata", "Kathmandu" => "Asia/Katmandu", "Astana" => "Asia/Dhaka", "Dhaka" => "Asia/Dhaka", "Sri Jayawardenepura" => "Asia/Dhaka", "Almaty" => "Asia/Almaty", "Novosibirsk" => "Asia/Novosibirsk", "Rangoon" => "Asia/Rangoon", "Bangkok" => "Asia/Bangkok", "Hanoi" => "Asia/Bangkok", "Jakarta" => "Asia/Jakarta", "Krasnoyarsk" => "Asia/Krasnoyarsk", "Beijing" => "Asia/Shanghai", "Chongqing" => "Asia/Chongqing", "Hong Kong" => "Asia/Hong_Kong", "Urumqi" => "Asia/Urumqi", "Kuala Lumpur" => "Asia/Kuala_Lumpur", "Singapore" => "Asia/Singapore", "Taipei" => "Asia/Taipei", "Perth" => "Australia/Perth", "Irkutsk" => "Asia/Irkutsk", "Ulaan Bataar" => "Asia/Ulaanbaatar", "Seoul" => "Asia/Seoul", "Osaka" => "Asia/Tokyo", "Sapporo" => "Asia/Tokyo", "Tokyo" => "Asia/Tokyo", "Yakutsk" => "Asia/Yakutsk", "Darwin" => "Australia/Darwin", "Adelaide" => "Australia/Adelaide", "Canberra" => "Australia/Melbourne", "Melbourne" => "Australia/Melbourne", "Sydney" => "Australia/Sydney", "Brisbane" => "Australia/Brisbane", "Hobart" => "Australia/Hobart", "Vladivostok" => "Asia/Vladivostok", "Guam" => "Pacific/Guam", "Port Moresby" => "Pacific/Port_Moresby", "Magadan" => "Asia/Magadan", "Solomon Is." => "Asia/Magadan", "New Caledonia" => "Pacific/Noumea", "Fiji" => "Pacific/Fiji", "Kamchatka" => "Asia/Kamchatka", "Marshall Is." => "Pacific/Majuro", "Auckland" => "Pacific/Auckland", "Wellington" => "Pacific/Auckland", "Nuku'alofa" => "Pacific/Tongatapu"}
    class << self
      def between(from, to, period = :all)
        super(from, to).to_time + random_time(period)
      end

      def forward(days = 365, period = :all)
        super(days).to_time + random_time(period)
      end

      def backward(days = 365, period = :all)
        super(days).to_time + random_time(period)
      end

      def year(option=nil)
        if option.eql?(:upcoming)
          (2015..2100).to_a.sample
        elsif option.eql?(:past)
          (1900..2014).to_a.sample
        else
          (1900..2100).to_a.sample
        end
      end

      def time_zone(option=nil)
        if option.eql?(:us_time_zone)
          us_zones = ZONES.invert.select { |k,v| k=~ /US|Arizona|Indiana|Hawaii|Alaska/ }.invert
          selected_zone = us_zones.keys.to_a.sample
        else
          selected_zone = ZONES.keys.to_a.sample
        end
        selected_zone
      end

      private

      def random_time(period)
        hours(period) + minutes + seconds
      end

      def hours(period)
        raise ArgumentError, 'invalid period' unless TIME_RANGES.has_key? period
        hour_at_period = TIME_RANGES[period].to_a.sample

        (60 * 60 * hour_at_period)
      end

      def minutes
        60 * seconds
      end

      def seconds
        (0..59).to_a.sample
      end
    end
  end
end
