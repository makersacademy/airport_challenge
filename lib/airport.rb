require_relative 'plane'

class Airport
  attr_reader :hangar

  def initialize
    @hangar = []
  end

  def land(plane)
    raise "Airport is full" if @hangar.count >= 100
    hangar << plane 
  end

  def take_off(plane)
    @hangar.pop
  end

end
