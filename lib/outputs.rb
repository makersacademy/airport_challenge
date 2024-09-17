class Outputs
  def output
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
