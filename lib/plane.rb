require './lib/airport'

class Plane

  attr_reader :flying
  attr_reader :at_airport

  def initialize
    @flying = false
    @at_airport = false
  end

  def landed
    @flying = false
  end

  def in_air
    @flying = true
  end

  def flying?
    @flying
  end

  def added_to_airport
    @at_airport = true
  end

  def at_airport?
    @at_airport
  end

end
