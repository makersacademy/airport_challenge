require_relative "weather.rb"

class Airport
  include Weather

  attr_reader :hangar, :DEFAULT_CAPACITY
  
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @DEFAULT_CAPACITY = capacity
  end

  def land_plane(plane)
    fail "Hangar Full" if full?
    fail "Stormy weather, no landing !" if stormy?
    
    @hangar << plane
  end

  def take_off(plane)
    fail "Stormy weather, no takeoff !"
    @hangar.delete(plane)
  end

  def plane_check(plane)
    @hangar.include?(plane)
  end

 private
  def full?
    @hangar.length >= @DEFAULT_CAPACITY
  end
  
end
