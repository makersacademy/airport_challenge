require_relative 'weather_reporter'

class Airport

  attr_accessor :stormy
  # accessor needed for spec only,
  # to set value of weather as true or false
  # in order to get tests to pass
  attr_reader :capacity, :planes, :name
  # all public methods -
  # :capacity needed for rspec,
  # :planes needed for rspec,
  # :name needed for plane.rb

  ### use the method is_stormy? to check the weather
  include WeatherReporter

  DEFAULT_CAPACITY = 20

  def initialize(location = "unnamed airport", capacity = DEFAULT_CAPACITY)
    @name = location
    @capacity = capacity
    @planes = []
    @stormy = stormy?
  end

  def receive(plane)
    raise "Too stormy to land" if @stormy

    raise "No more space!" if full?

    @planes.push(plane)
    # this method will return @planes array
  end

  def send(plane)
    raise "Too stormy to take off" if @stormy

    @planes.delete(plane)
    # this method will return the plane it deleted
  end

  private

  def full?
    @planes.length >= @capacity
  end

end
