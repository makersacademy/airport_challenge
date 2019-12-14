require_relative 'plane'
class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes 
  attr_accessor :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    @planes.count < DEFAULT_CAPACITY ? @planes << plane : raise('Airport is full!')
  end

  def take_off(plane)
    @planes.delete(plane)
  end

  def confirm_take_off(plane)
    if !@planes.include? plane
      'Plane has left the airport'
    else
      raise 'Plane has not taken off.'
    end
  end
end