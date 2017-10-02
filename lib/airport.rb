require_relative 'weather.rb'

class Airport

  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @capacity = capacity
  end

  def land(plane)
    fail 'Airport is full!' if full?
    fail 'That plane is already landed here!' if @planes.include? plane
    fail 'Plane already landed elsewhere!' if plane.status == 'Landed'
    plane.status = "Landed"
    @planes << plane
    plane
  end

  def take_off
    fail 'There are no planes!' if empty?
    @planes.pop.status = "Taken off"
  end

  private
  attr_reader :plane

  def full?
    @planes.count >= @capacity
  end

  def empty?
    @planes.empty?
  end
end
