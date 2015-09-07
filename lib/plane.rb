require './lib/airport.rb'

class Plane

attr_reader :flying

  def initialize
    @flying = true
  end

  def land
    @flying = false
  end

  def landed?
    !@flying
  end

  def take_off
    @flying = true
  end

end
