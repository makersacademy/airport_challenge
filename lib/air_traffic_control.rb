require 'weather' # rspec doesn't like this being called ./weather, but the IDE does
require 'system_designer' # rspec doesn't like this being called ./system_designer, but the IDE does

class AirTrafficControl

  def initialize(capacity)
    designer = SystemDesigner.new
    weather = Weather.new

    @airport_capacity = designer.default_capacity(capacity)
    weather.random_weather

  end

  def airport_capacity
    @airport_capacity
  end

  def outputs
    weather = Weather.new
    airport = AirTrafficControl.new(20)
    puts "create random weather status: #{weather.random_weather}"

        puts "==========="

    puts "weather status? stormy or sunny: #{weather.weather_status}"

    puts "==========="

    puts "stormy? true or false: #{weather.weather_stormy?}"

    puts "==========="

    puts "airport capacity: #{airport.airport_capacity}"

    puts "==========="
  end
end

airport = AirTrafficControl.new(20)
airport.outputs
