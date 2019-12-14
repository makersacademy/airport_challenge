require_relative 'plane'

class Airport

attr_accessor :dock

  def initialize
    @dock = []
  end

  def land(plane)
    @dock << plane
  end

  def take_off(plane)
    @dock.delete(plane)
  end
  
end