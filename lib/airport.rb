require_relative 'weather.rb'
require_relative 'plane.rb'
class Airport

  include Weather

  def initialize
    @planes = []
    @hanger_capacity = 1
  end

  attr_reader :planes 
  attr_accessor :hanger_capacity

  def land_plane(plane)
    raise "Airport Full" if airport_full? 
    raise "This plane has already landed" if !flying?(plane)

    puts "takeoff, plane: #{plane} flying: #{plane.flying}"
    puts "result of flying? function: #{!flying?(plane)}"

    handle_landing(plane)
  end

  def take_off(plane)
    raise "This plane is already flying" if flying?(plane)
    raise "It's too stormy to take off" if stormy?
    raise "There are no planes to take off" if airport_empty?
    
    handle_takeoff
  end

  private

  def stormy?
    Weather.stormy?
  end

  def record_departure
    @planes.delete_at(@planes.length - 1)
  end

  def record_landing(plane)
    plane.flying = false
  end

  def airport_full?
    @planes.length >= @hanger_capacity
  end

  def handle_landing(plane)
    @planes << plane
    record_landing(plane)
  end

  def handle_takeoff
    Plane.new true
    record_departure
  end

  def airport_empty?
    @planes == []
  end

  def flying?(plane)
    plane.flying
  end

end
