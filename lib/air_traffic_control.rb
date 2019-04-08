require 'planes'
require 'weather'
require 'airport_occupancy.rb'

class AirTrafficControl # Resposible of issuing landing and takeoff instructions
  attr_accessor :capacity, :stormy, :planes_list
  #attr_reader

  @stormy = Weather.new

  def initialize(capacity = 20)
    @capacity = capacity
    @planes_list = []
  end

  def land(plane)
    raise "Airport full, can't land now!" if AirportOccupancy.new(@capacity, @planes_list.count).check_full
    raise "This plane landed in the airport already!" if @planes_list.include?(plane)
    raise "Stormy weather, can't land now!" if @stormy
    @planes_list << (plane)
  end

  def take_off(plane)
    raise "Airport empty, no planes to takeoff!" if AirportOccupancy.new(@capacity, planes_list.count).check_empty
    raise "This plane left the airport already!" if !@planes_list.include?(plane)
    raise "Stormy weather, can't take off now!" if @stormy
    @planes_list.delete(plane)
  end
end
