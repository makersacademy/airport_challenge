require 'plane'


class Airport

  attr_reader :planes_at_airport
  attr_reader :capacity
  attr_reader :at_airport
  attr_reader :stormy
  attr_reader :weather

  DEFAULT_CAPACITY = 10

  def initialize(capacity=DEFAULT_CAPACITY, at_airport=false,stormy=false,weather=0)
    @planes_at_airport = []
    @capacity = capacity
    @at_airport = at_airport
    @stormy = stormy
    @weather = weather
  end

  def receive_plane(plane,capacity=DEFAULT_CAPACITY)
    raise "The plane cannot land because the airport is full" if full?
    check_if_stormy
    raise "The plane cannot land due to storms" if check_if_stormy
    @planes_at_airport << plane
    @at_airport = true
    plane
  end

def check_if_stormy
  todays_weather
  report_storms if @weather == 1
  stormy?
end

  def todays_weather
      @weather = rand(2)
    end

  def stormy?
      @stormy
    end

def report_storms
        @stormy = true
    end


  private def full?
    @planes_at_airport.length >= DEFAULT_CAPACITY
  end

  def at_airport?
    @at_airport
  end


  def plane_take_off(plane)
    raise "The plane is not at this airport" if !at_airport?
    raise "The plane cannot take off due to storms" if check_if_stormy
    @planes_at_airport.pop
    @at_airport = false
    "The plane has taken off"
  end


end
