require 'plane'
require 'weather'

class Airport

  attr_reader :tarmac, :capacity

  def initialize(capacity = 1)
    @capacity = capacity
    @tarmac = []
    @weather = Weather.new
  end

  def land(plane)
    raise('Tarmac is full.') if full?
    raise('Treacherous conditions. Stay put.') if stormy?
    plane.location = self
    @tarmac << plane
  end

  def take_off(plane)
    raise('Plane is already flying.') if plane.location == 'Sky'
    raise('Stormy. Cannot take off.') if stormy?
    @tarmac.delete(plane)
    plane.location = 'Sky'
  end

  def confirm(plane)
    plane.location == 'Sky' ? 'Flying high!' : 'Still here.'
  end

  private

  def full?
    @tarmac.length == @capacity
  end

  def update_location
    plane.location == 'Sky'
  end

  def stormy?
    weather.check
  end
  
end
