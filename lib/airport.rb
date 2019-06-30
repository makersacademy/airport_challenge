require_relative 'weather'

class Airport
  DEFAULT_CAPACITY = 50

  attr_accessor :planes, :stormy, :capacity

  def initialize
    @planes = []
    @stromy = stormy
    @capacity = 50
  end

  include Weather

  def land(plane)
    raise 'Landing not allowed due to the poor weather conditions' if @stormy
    raise 'Plane is full' if full?
    @planes << plane
  end

  def take_off(plane)
    raise 'Take off not allowed due to the poor weather conditions' if @stormy
    @planes.pop(plane)
  end

  def empty_error
    raise "No planes available" if empty?
  end

  private


  def empty?
    @planes.empty?
  end

  def full?
    @planes.length >= capacity
  end

end
