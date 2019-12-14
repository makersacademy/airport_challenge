require_relative 'plane'
require_relative 'weather'


class Airport
  DEFAULT_CAPACITY = 5
  attr_reader :planes 
  attr_accessor :capacity

  def initialize (capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    if Weather.stormy?
      raise 'Weather is stormy, cannot land'
    end
    @planes.count < DEFAULT_CAPACITY ? @planes << plane : raise('Airport is full!')
    
  end

  def take_off(plane)
    if Weather.stormy?
      raise 'Weather is stormy, cannot take off'
    end
    @planes.delete(plane)
  end

  def confirm_take_off(plane)
    if !@planes.include? plane
      'Plane not at the airport'
    else
      raise 'Plane has not taken off.'
    end
  end

end