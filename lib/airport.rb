require_relative 'plane'
require_relative 'weather'

class Airport
  include Weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  attr_accessor :capacity
  attr_reader :planes, :weather

  def landing(plane= Plane.new)
    fail 'Can not land plane' if weather == :stormy
    fail 'Can not land plane' if full?
    plane.landed
    planes << plane
  end

  def take_off(plane= Plane.new)
    fail 'Can not take off' if weather == :stormy
    plane.flying
    planes.delete(plane)
  end

  private

  def full?
    planes.count >= capacity
  end
end
