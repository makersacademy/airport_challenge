require 'weather'

class Dispatcher

  def initialize
    @local_weather = Weather.new
  end

  def travel_allowed?
    @local_weather.stormy? ? raise 'Travel not allowed due to weather conditions' : true     
  end
end
