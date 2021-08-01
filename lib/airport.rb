require "./plane.rb"
require "./weather.rb"

class Airport
  attr_reader :hangar, :capacity, :weather

  DEFAULT_CAPACITY = 12

  def initialize(capacity = 12, weather = Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(planes)
    puts "The landing is delayed due to stormy weather" if weather.stormy?
    (hangar_full?) ? (puts 'Hangar is full!') : (@hangar.push(planes))
  end

  def takeoff(planes)
    puts "Takeoff is delayed due to stormy weather" if weather.stormy?
    @hangar.pop
  end

  private
  def hangar_full?
    @hangar.count >= DEFAULT_CAPACITY
  end
end

# class Weather 

#   def stormy?
#     weather_forecast == :stormy
#   end 

#   private

#   FORECAST = [:stormy, :sunny, :sunny, :raining, :cloudy, :sunny]

#   def weather_forecast
#     FORECAST.sample
#   end
# end


