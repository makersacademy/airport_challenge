require_relative 'plane.rb'

class Airport

  DEFAULT_CAPACITY = 20

  attr_accessor :capacity
  attr_reader :planes, :weather

  def initialize(weather = Weather.new, planes = [], capacity = DEFAULT_CAPACITY)
    @weather = weather
    @planes = planes
    @capacity = capacity
  end

  def arrivals(plane = Plane.new)
    airport_full
    error_message = "Bad weather conditions to land"
    raise error_message if weather.stormy?
    @planes << plane
  end

  def departures
    airport_empty?
    error_message = "Bad weather conditions to depart"
    raise error_message if weather.stormy?
    @planes.pop
  end

  private
  def airport_full
    error_message = "Airport is full"
    raise error_message if @planes.length >= @capacity
  end

  def airport_empty?
    error_message = "No planes landed"
    raise error_message if @planes.empty?
  end

end
