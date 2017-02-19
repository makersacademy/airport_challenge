require_relative 'plane'
require_relative 'weather'

class Airport
  MAX_CAPACITY = 20
  attr_accessor :capacity
  attr_reader :planes

  def initialize(capacity = MAX_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    landing_conditions(plane)
    plane.landed
    @planes << plane
    confirm_landing
  end

  def take_off(plane)
    take_off_conditions(plane)
    plane.flying
    @planes.delete(plane)
    confirm_take_off
  end


  private

  def landing_conditions(plane)
    raise "Plane already landed" if @planes.include?(plane)
    raise "Airport is full" if airport_full?
    raise "Too stormy for landing" if stormy?
  end

  def take_off_conditions(plane)
    raise "Plane is already flying" if plane.in_flight
    raise "Airport is empty" if airport_empty?
    raise "Too stormy for take off" if stormy?
    raise "Plane isn't located at this airport" if !@planes.include?(plane)
  end

  def confirm_landing
    "Landing successful."
  end

  def confirm_take_off
    "Take off successful."
  end

  def stormy?
    Weather.new.randomize
  end

  def airport_full?
    @planes.count == capacity
  end

  def airport_empty?
    @planes.empty?
  end

end
