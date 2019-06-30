require 'plane'


class Airport

  attr_reader :planes_at_airport
  attr_reader :capacity
  attr_reader :at_airport


  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY, at_airport=false)
    @planes_at_airport = []
    @capacity = capacity
    @at_airport = at_airport
  end

  def receive_plane(plane,capacity=DEFAULT_CAPACITY,stormy=false)
    raise "The plane cannot land because the airport is full" if full?
    raise "The plane cannot land due to storms" if stormy?
    @planes_at_airport << plane
    @at_airport = true
    plane
  end

  private def full?
    @planes_at_airport.length >= DEFAULT_CAPACITY
  end

  def at_airport?
    @at_airport
  end

  def weather_generator
    rand(1)
  end

  def stormy?
    weather_generator == 1
  end

  def plane_take_off(plane,stormy=false)
    raise "The plane cannot take off due to storms" if stormy?
    raise "The plane is not at this airport" if !at_airport?
    @planes_at_airport.pop
    @at_airport = false
    "The plane has taken off"
  end


end
