require './lib/weather'
require './lib/airport'
require './lib/controller'

def check_stormy?
  5.times do
    weather = Weather.new
    puts weather.stormy?
  end
end

def check_airport_capacity
  airport = Airport.new
  puts airport.capacity == 20
end

def check_airport_full
  airport = Airport.new
  puts airport.full?
  airport.full
  puts airport.full?
end

def controller_sets_airport_full
  airport = Airport.new
  controller = Controller.new(airport)
  controller.capacity_reached
  puts controller.airport.full?
end

def controller_landing_enabled(weather_today, full)
  # controller_landing_enabled(:fine, false)
  # controller_landing_enabled(:fine, true)
  # controller_landing_enabled(:stormy, false)
  # controller_landing_enabled(:stormy, true)
  airport = Airport.new
  weather = Weather.new([weather_today])
  controller = Controller.new(airport, weather)
  controller.capacity_reached if full
  p "weather is #{weather_today}, airport is full? #{controller.airport.full?}"
  p "Landing enabled: #{controller.landing_enabled}"
end

def controller_takeoff_enabled(weather_today)
  # controller_takeoff_enabled(:fine)
  # controller_takeoff_enabled(:stormy)
  airport = Airport.new
  weather = Weather.new([weather_today])
  controller = Controller.new(airport, weather)
  p "weather is #{weather_today}"
  p "Landing enabled: #{controller.takeoff_enabled}"
end
 controller_takeoff_enabled(:fine)
 controller_takeoff_enabled(:stormy)
