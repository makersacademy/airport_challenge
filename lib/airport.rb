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
    fail 'The plane cannot land' if unfavourable? || full?
    planes << plane
  end

  def take_off
    fail 'The plane cannot take off' if empty? || unfavourable?
    planes.pop
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
