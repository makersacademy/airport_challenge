require './lib/airport.rb'

class Plane

attr_reader :flying

  def initialize
    @flying = true
  end

  def flying?
    @flying
  end

  def landed
    @flying = false
  end

  def taken_off
    @flying = true
  end

end
