require_relative './weather'

class Dispatcher

  def initialize
    @local_weather = Weather.new
  end

  def travel_allowed?
    !@local_weather.stormy?
  end
end
