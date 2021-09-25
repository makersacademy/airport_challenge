require 'plane'

class Airport

  attr_reader :tarmac, :name, :capacity

  def initialize(name = 'LHR', capacity = 1)
    @name = name
    @capacity = capacity
    @tarmac = []
  end

  def land(plane)
    raise('Tarmac is full.') if full?
    raise('Treacherous conditions. Stay put.') if stormy?
    plane.ground = true
    plane.location = @name
    @tarmac << plane.name
  end

  def take_off(plane)
    raise('Stormy. Cannot take off.') if stormy?
    raise('Aircraft is not under your control.') unless plane.location == @name
    @tarmac.delete(plane.name)
    plane.ground = false
    plane.location = 'Sky'
  end

  def confirm(plane)
    plane.location == 'Sky' ? 'Flying high!' : 'Still here.'
  end

  private

  def full?
    @tarmac.length == @capacity
  end

  def stormy?
    rand(1..3) == 1
  end

  # def not_here?(plane)
    
  # end

end
