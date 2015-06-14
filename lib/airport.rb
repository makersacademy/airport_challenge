require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 50

  attr_accessor :capacity

  def initialize capacity = DEFAULT_CAPACITY
    @capacity = capacity
    @planes = []
  end

  def take_off
    fail 'Airport empty' if empty?
    planes.last.take_off
    planes.pop
  end

  def landing plane
    fail 'Airport full' if full?
    planes << plane
  end


  private
  attr_reader :planes

  def stormy?
    weather == 'stormy'
  end

  def weather
  end

  def empty?
    planes.count == 0
  end

  def full?
    planes.count >= capacity
  end
end
