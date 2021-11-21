require_relative 'airport'

class Plane
  attr_reader :in_airport
# assume plane is create at the airport
  def initialize
    @in_airport = false
  end

  def landed
    @in_airport = true
  end

  def taken_off
    @in_airport = false
  end
end
