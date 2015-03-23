require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :capacity, :planes, :condition
  def initialize
    @planes = []
    @capacity = 6
    weather = %w(Sunny Stormy)
    @condition = weather.sample
  end

  def land(plane)
    permission
    fail 'The plane cannot land' if full?
    planes << plane
    plane.landed
  end

  def take_off
    permission
    fail 'The plane cannot take off' if empty?
    planes.pop
    plane.taked_off
  end

  def permission
    fail 'The plane cannot take off' if unfavourable?
  end

  def unfavourable?
    condition == 'Stormy'
  end

  def empty?
    planes.empty?
  end

  def full?
    planes.length == capacity
  end
end
