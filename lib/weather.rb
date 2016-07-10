require 'open-uri'
require 'json'
class Weather
  def initialize
    @visibility_mi
  end

  attr_reader :visibility_mi
  attr_reader :temp_c

  def set_current_weather
    open('http://api.wunderground.com/api/e173423eb2f5bdfd/geolookup/conditions/forecast/q/UK/Heathrow.json') do |f|
      json_string = f.read
      parsed_json = JSON.parse(json_string)
      location = parsed_json['location']['city']
      @temp_c = parsed_json['current_observation']['temp_c']
      print "Current temperature in #{location} is: #{@temp_c}\n"
      @visibility_mi = parsed_json['current_observation']['visibility_mi']
      print "Current visibility in #{location} is: #{@visibility_mi}\n"
    end
  end


  def self.clear?
   @visibility_mi.to_i >= 8 ? true : false
  end

  # def self.clear?
  #   rand(10) >= 2 ? true : false
  # end


end
