require_relative 'plane'

class Airport
  attr_accessor :airborne
  attr_accessor :docked
  attr_accessor :capacity
  attr_accessor :forecast
  
  def initialize(capacity = 20)
    @docked = []
    @airborne = []
    @weather = ['clear', 'cloudy', 'raining', 'stormy']
    @capacity = capacity
  end

  def land(plane)
    @docked << plane unless full_error || weather_error_land
  end

  def takeoff(plane)
    @airborne << @docked.delete(plane) unless weather_error_takeoff
  end

  private

  def forecast_sum
    @forecast = @weather.sample
  end

  def full_error
    fail "Airport Full" if @docked.length >= @capacity 
  end

  def weather_error_takeoff
    fail "Cannot take off in this weather" if @forecast == 'stormy'
  end

  def weather_error_land
    fail "Cannot land in this weather" if @forecast == 'stormy'
  end
end
