require_relative 'Plane'

class AirPort
  attr_reader :hangar
  attr_accessor :capacity

  def initialize
    @hangar = []
    @capacity = 200
  end

  def land(plane)
    fail 'Impossible to land weather stormy!' if @weather == 'stormy'
    fail 'AirPort reached max capacity!' if @hangar.length >= @capacity
    @hangar << plane
  end

  def take_off
    fail 'Impossible to take off weather stormy!' if @weather == 'stormy'
    @hangar.delete_at(0)
    'Plane left the Ariport!'
  end

  def weather
    @weather = ['sunny', 'stormy'].sample
    @weather
  end
end
