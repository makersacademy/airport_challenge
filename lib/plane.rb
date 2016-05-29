require_relative 'airport.rb'

class Plane

  def initialize
	@at_airport = false
	@flying = true
  end

  def landed?
	@at_airport
  end

  def flying?
    @flying
  end

   def land
    @at_airport = true
    @flying = false
  end

  def take_off
    @at_airport = false
    @flying = true
  end

end

