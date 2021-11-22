require_relative 'plane'
require_relative 'air_control.rb'

class Airport
  include AirportControl
  attr_reader = :name, :capacity, :hangar, :planes_on_runway

  def initialize(name, capacity = 5)
    @name = name
    @capacity = capacity
    @hangar = [] #Stores planes which have landed. These planes are not allowed to take off again
    @queue = [] #Stores requests from planes that wish to land at the airport 
    @planes_on_runway = [] #Stores all the planes on runways, ready for departure 
  end
  
  def check_requests
    @@land_request.each do |planes|
      if planes.destination == @name
        @queue << planes
      end
    end
  end

  def accept_requests
    if @queue.count <= @capacity
      @hangar << @queue
    elsif @queue.count > @capacity
      raise "Sorry we have reached maximum capacity"
    elsif @queue.empty?
      raise "There are no landing requests"
    end
  end

  
end

# require_relative 'plane.rb'
# require_relative 'air_control.rb'
# class Airport
#   include AirportControl
#   @@landed_planes = []
#   def initialize(name, capacity)
#     @name = name
#     @capacity = capacity
#   end
#   def take_off
#     check_weather
#     if check_weather == "Clear" && @flight_status != "Flying"
#       "#{} has taken off!"
#     else
#       raise "Sorry, conditions must be clear before take off"
#     end
#   end
#   def simple
#     "stringss"
#   end
# end
