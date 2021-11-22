require_relative 'plane'
require_relative 'air_control.rb'

class Airport
  include AirportControl

  attr_reader = :name, :capacity, :hangar, :planes_on_runway

  def initialize(name, capacity = 5)
    @name = name
    @capacity = capacity
    @hangar = [] # Stores planes which have landed. These planes are not allowed to take off again
    @queue = [] # Stores requests from planes that wish to land at the airport 
    @planes_on_runway = [] # Stores all the planes on runways, ready for departure 
  end

  def check_requests # Checks if planes meet requirements for landing at destination airport
    @@land_request.each do |planes|
      if planes.destination == @name
        @queue << planes
      end
    end
    @queue
  end

  def accept_requests # Accepts planes that meet landing requirements
    check_requests
    if @queue.count > @capacity
      raise "Sorry we have reached maximum capacity"
    elsif @queue.count <= @capacity
      @@hangar << @queue
    end
  end

end



# def accept_requests # Accepts planes that meet landing requirements
#   if @queue.count > @capacity
#     raise "Sorry we have reached maximum capacity"
#   elsif @queue.count <= @capacity
#     @hangar << @queue
#   end
# # end
