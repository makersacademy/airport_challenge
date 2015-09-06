require_relative './weather.rb'

class Airport
  CAPACITY = 10

  attr_reader :capacity

  def initialize
    @planes = []
  end

  def planes?
    @planes
  end

  def receive(plane, weather)
    fail 'The airport is full.' if full?
    fail 'Plane cannot land due to bad weather conditions.' if weather.stormy?

    printf weather.stormy?

    plane.land
    @planes << plane
  end

  def release(weather)
    fail 'No planes available.' if empty?
    fail 'Plane cannot take off due to bad weather conditions.' if weather.stormy?

    plane = @planes.pop
    plane.take_off
    plane
  end

  private

  def full?
    @planes.count >= CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
