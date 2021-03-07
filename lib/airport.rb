require 'plane'
require_relative 'weather'

class Airport
  attr_accessor :capacity
  DEFAULT_CAPACITY = 15

  include WeatherConditions

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes_at_airport = []
    @capacity = capacity
  end 

  def land(plane)
    raise 'Plane cannot land due to weather conditions' if stormy?
    raise 'Airport is full: plane cannot land' if full?

    @planes_at_airport << plane
  end 

  def takeoff(plane)
    raise 'Plane cannot takeoff due to weather conditions' if stormy?
    raise 'Airport is empty: no planes to takeoff' if empty?

    @planes_at_airport.delete(plane)
  end 

  def full?
    @planes_at_airport.count >= capacity
  end 

  def empty?
    @planes_at_airport.empty?
  end

end

# class DockingStation

#   attr_accessor :docking_station, :capacity, :broken_bikes
#   DEFAULT_CAPACITY = 20

#   def initialize(capacity = DEFAULT_CAPACITY)
#     @docking_station = []
#     @broken_bikes = []
#     @capacity = capacity
#   end

#   def release_bike
#     raise "No bikes" if empty? 
#     @docking_station.last
#   end

#   def return_bike(bike)
#     raise "Dock Full" if full?
#     if bike.status == true
#       @docking_station << bike
#       puts "working bike docked" 
#     else 
#       @broken_bikes << bike
#       puts "broken bike docked"
#     end
#   end

#   def show_bikes
#     @docking_station
#   end

#   private 

#   def full?
#     @docking_station.count + @broken_bikes.count >= capacity
#   end 

#   def empty?
#     @docking_station.empty? 
#   end
# end
