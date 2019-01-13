require 'planes'
require 'weather'
require 'airport_occupancy.rb'

class AirTrafficControl # Resposible of issuing landing and takeoff instructions
  attr_accessor :planes_list, :capacity, :stormy

  @stormy = Weather.new

  def initialize(planes_list = [], capacity = 20)
    @planes_list = planes_list
    @capacity = capacity
  end

  def land(plane)
    is_full = AirportOccupancy.new(@capacity, @planes_list.count).check_full
    raise "Airport full, can't land now!" if is_full
    raise "This plane landed in the airport already!" if @planes_list.include?(plane)
    @planes_list << (plane) unless @stormy
    raise "Stormy weather, can't land now!" if @stormy
  end

  def take_off(plane)
    is_empty = AirportOccupancy.new(@capacity, planes_list.count).check_empty
    raise "Airport empty, no planes to takeoff!" if is_empty
    raise "This plane left the airport already!" if !@planes_list.include?(plane)
    @planes_list.delete(plane) unless @stormy
    raise "Stormy weather, can't take off now!" if @stormy
  end
end
