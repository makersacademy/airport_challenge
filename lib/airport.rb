require_relative 'plane'
require_relative 'weather'

class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :hanger
  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @hanger = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    raise 'Hanger full, abort landing!' if hanger_full?

    raise 'That plane is already here' if landed?(plane)

    raise 'Stormy weather, abort landing!' if stormy?

    plane.landed
    @hanger << plane
  end

  def take_off(plane)
    raise "That plane isn't here" unless landed?(plane)

    raise "Stormy weather, cannot take off" if stormy?

    plane.in_the_air
    hanger.delete(plane)
  end 

 private 

  def hanger_full?
    @hanger.count >= @capacity
  end

  def landed?(plane)
    hanger.include?(plane)
  end

  def stormy?
    @weather.stormy?
  end 

end
