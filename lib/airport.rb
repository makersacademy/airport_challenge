require_relative 'plane'  # => true

class Airport

  attr_reader :good_weather  # => nil

  def initialize
    @good_weather = true  # => true
  end

  def land(plane)
    raise 'Airport is full!' if @plane                                                          # => nil
    @good_weather ? (@plane = plane) : (raise 'Landing denied. Weather is stormy!')  # ~> RuntimeError: Permission to land denied. Weather is stormy!
  end

  def take_off
    raise 'No plane at airport' unless @plane
    @good_weather ? @plane : (raise 'Take-off denied. Weather is stormy!')
  end

  def weather
    random = rand(2)                                            # => 1
    random == 0 ? @good_weather = true : @good_weather = false  # => false
  end

end
