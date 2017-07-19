require 'pry'
require_relative 'plane.rb'
require_relative'weather.rb'

class Airport

  attr_reader :planes, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather)
    @capacity = capacity
    @planes = []
    @weather = weather
  end

  def land(plane)
    raise "Maximum capacity of the airport is reached!" if full?
    raise "The plane can't land due to stormy weather!" if stormy?
    plane.land
    planes << plane
  end

  def take_off(plane)
    raise "There are no planes at the airport for take off!" if empty?
    raise "The plane can't take off due to stormy weather!" if stormy?
    plane.take_off
    planes.delete(plane)
  end

  private

  attr_reader :weather

  def full?
    planes.length == capacity
  end

  def empty?
    planes.empty?
  end

  def stormy?
    weather.stormy?
  end

end
