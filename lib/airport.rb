require 'plane'
require 'weather'

class Airport 
  attr_reader :plane, :hangar, :capacity, :storm
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY, weather: Weather.new)
    @hangar = []
    @capacity = capacity
    @storm = weather.stormy?
  end

  def land(plane)
    fail 'Airport is full' if full?

    fail 'Weather is too bad' if @storm == true

    @hangar.push(plane)
  end

  def take_off
    fail 'Airport is empty' if empty?

    # fail 'Weather is too bad' if weather?

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
