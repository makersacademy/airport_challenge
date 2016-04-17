require_relative 'weather'
require_relative 'plane'

class Airport
  attr_reader :capacity, :run_way
  DEFAULT_CAPACITY = 25


  def initialize(capacity = DEFAULT_CAPACITY)
    @run_way = []
    @capacity = capacity
  end

  def permission_to_land?(plane)
    return insult(plane) unless plane.flying?
    return false if !Weather.sunny? || full?
    true
  end

  def permission_to_leave?(plane)
    return insult(plane) unless present?(plane)
    return false if !Weather.sunny?
    true
  end

  # def land(plane)
  #   fail "No room here mate" if full?
  #   weather_test
  #   plane.land(self)
  #   @planes << plane
  #   "That was a bumpy landing sir"
  # end
  #
  # def take_off
  #   fail "No planes here mate" if empty?
  #   weather_test
  #   planes.shift.take_off
  #   "Don't forget to send a postcard"
  # end
  #
  # def planes_in_airport
  #   planes
  # end
  #
  # def airport_capacity
  #   capacity
  # end
  def insult(plane)
    "You been on the wacky-backy, You're in #{plane.location}"
  end

  private
  # attr_reader :planes, :capacity

  def full?
    run_way.size >= capacity
  end

  def present?(plane)
    plane.location == self
  end



  #
  # def empty?
  #   planes == []
  # end
end
