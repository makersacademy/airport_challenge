require_relative 'plane'

class Airport
  attr_reader :stored_planes, :weather
  CAPACITY = 5

  def initialize 
    @stored_planes = []
    @capacity = CAPACITY
    @weather = self.set_weather
  end

  def land(plane)
    fail 'Airport full!' if full?
    fail 'Cannot land - stormy weather!' if @weather == 'Stormy'
    @stored_planes << plane
  end

  def depart(plane)
    fail 'No planes' if empty?
    fail 'Plane not in airport' if !@stored_planes.include?(plane)
    @stored_planes.delete(plane)
  end

  def adjust_capacity(number)
    @capacity = number
  end

  def set_weather
    die = rand(100)
    die > 100 ? 'Stormy' : 'Sunny'
  end

  private

  attr_accessor :capacity

  def full?
    @stored_planes.length >= @capacity
  end

  def empty?
    @stored_planes == []
  end

end
