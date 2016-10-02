require_relative 'plane'

class Airport

  $weather = [:Stormy, :Sunny, :Cloudy, :Windy, :Rainey]
  DEFAULT_CAPACITY = 5

  attr_accessor :the_weather, :runway
  attr_reader :plane

  def initialize(capacity = DEFAULT_CAPACITY, weather = change_weather)
    @runway = []
    @the_weather = weather
    @capacity = capacity
  end

  def current_weather
    @the_weather
  end

  def change_weather
   @the_weather = $weather.sample
   @the_weather
  end

  def land_plane(plane)
   fail 'DANGER! Stormy weather' if stormy?
   fail 'DANGER! Runway full' if full?
   fail 'This plane has already landed!' if include(plane)
   add_plane(plane)
   @runway
  end

  def landing_check(plane)
    if include(plane) then true else false end
  end

  def take_off(plane)
   fail 'DANGER! Stormy weather' if the_weather == :Stormy
   fail 'That plane isn\'t in this airport!' if !include(plane)
   remove_plane(plane)
   @runway
  end

  def take_off_check(plane)
    if include(plane) then false else true end
  end

  def include(plane)
   @runway.include?(plane)
  end

  def airport_capacity
   @capacity
  end

 private

  def stormy?
   if the_weather == :Stormy then true else false end
  end

  def full?
   @runway.count >= @capacity
  end

  def add_plane(plane)
    @runway.push(plane)
  end

  def remove_plane(plane)
   @runway.delete_if{ |x| x == plane }
  end
end
