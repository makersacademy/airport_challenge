require './lib/weather'
require './lib/airport'
require './lib/controller'
require './lib/plane'

Describe Controller do
airport = Airport.new(3)
weather = Weather.new([:fine])
planes = [Plane.new,Plane.new,Plane.new]
controller = Controller.new(airport,weather,planes)
expect(controller.planes_inbound.count).to eq 3
expect(airport.planes_on_the_ground).to be 0
controller.issue_landing_instruction
controller.issue_landing_instruction
controller.issue_landing_instruction
expect(controller.planes_inbound.count).to eq 0
expect(airport.planes_on_the_ground).to be 3
expect{controller.issue_landing_instruction}.to raise_error "Landing not possible at the moment"
expect(controller.planes_outbound.count).to eq 0
=begin
def plane_airborne
  plane = Plane.new(false)
  puts "plane airborne: #{plane.airborne?}"
  plane.set_airborne
  puts "plane airborne: #{plane.airborne?}"
end
plane_airborne
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
=end
