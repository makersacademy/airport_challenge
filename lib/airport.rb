require 'plane'
require 'weather_condition'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 15

  def initialize(capacity=DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather=Weather.new
  end

  def instruct_plane_land(plane)

    fail "Weather is not good, #{plane} cannot land" if bad_weather?
    fail "Hangar is full, #{plane} not able to land" if full?
    @hangar << plane
    "#{plane} has landed"

  end

  def instruct_plane_take_off(plane)
    fail "Weather is not good, #{plane} cannot take off" if bad_weather?
    fail 'Hangar is empty, no plane to take off' if empty?
    @hangar.delete(plane)
    "#{plane} has left airport"
  end

  private
  
  def bad_weather?
    :weather_condition == "stormy"? true : false
  end

  def full?
    @hangar.count >= DEFAULT_CAPACITY
  end

  def empty?
    @empty = @hangar.empty?
  end

end
