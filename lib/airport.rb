require_relative 'plane'
require_relative 'weather'

class Airport 
  attr_reader :plane, :hangar, :capacity, :weather
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @hangar = []
    @capacity = capacity
    @weather = weather
  end

  def land(plane)
    fail 'Airport is full' if full?

    fail 'Weather is too bad' if @weather.stormy?

    @hangar.push(plane)
  end

  def take_off
    fail 'Airport is empty' if empty?

    fail 'Weather is too bad' if @weather.stormy?

    @hangar.pop
  end

  private 

  def full?
    @hangar.size >= capacity
  end

  def empty?
    @hangar.empty?
  end  
end
