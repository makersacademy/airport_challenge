require 'weather' #rspec doesn't like this being called ./weather, but the IDE does

class Airport

  def initialize
    @airport_capacity = 0
    weather = Weather.new
    weather.random_weather
  end

  def get_airport_capacity
    @airport_capacity
  end

  def update_airport_capacity(capacity)
    @airport_capacity = capacity
  end

  def outputs
    weather = Weather.new
    puts "create random weather status: #{weather.random_weather}"

    puts "==========="

    puts "weather status? stormy or sunny: #{weather.get_weather_status}"

    puts "==========="

    puts "stormy? true or false: #{weather.weather_stormy?}"

    puts "==========="

  end
end

airport = Airport.new
airport.outputs




