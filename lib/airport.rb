require_relative 'weather.rb'

class Airport


  def initialize
    @airport = []
    @bad_weather = nil
  end

  def landing(plane)
    raise 'airport is full' if @airport.length == 1
    raise 'too stormy to land' if weather?(Weather.new.stormy?) == true
    @airport << plane
  end

  def taking_off(plane)

  end

  def weather?(stormy)
    @bad_weather = stormy
    @bad_weather
  end


end
