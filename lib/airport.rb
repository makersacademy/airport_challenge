require_relative 'plane'

class Airport

DEFAULT_CAPACITY = 10

  def initialize
    @hangar = []
  end

  def take_off
    fail 'No planes available' if empty?
    @hangar.pop
  end

  def land(plane)
    fail 'Airport is full' if full?
    @hangar << plane
    @hangar[0]
  end

  attr_reader :hangar

  private

  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def empty?
    @hangar.empty?
  end

end
