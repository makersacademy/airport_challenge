require_relative 'aircraft'
require_relative 'weather'

class Airport
  attr_reader :capacity, :dock
  DEFAULT_CAPACITY = 5

  # creates an airport with a dock and an amendable capacity
  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @dock = []
  end

  # instructs the specified aircraft to land (or not)
  def land aircraft, weather=Weather.new
    can_land? aircraft, weather
    aircraft.change_status
    @dock << aircraft
    "The #{aircraft} has landed safely to #{self}"
  end

  # instructs the specified aircraft to takeoff (or not)
  def takeoff aircraft, weather=Weather.new
    can_takeoff? aircraft, weather
    aircraft.change_status
    @dock.delete aircraft
    "The #{aircraft} has successfully taken off from #{self}"
  end

  private

  # error handling for landing
  def can_land? aircraft, weather=Weather.new
    raise 'The aircraft is on the ground' if aircraft.landed == true
    raise 'The airport is full' if full
    raise 'Weather not ideal.' if weather.stormy
  end

  # error handling for takeoff
  def can_takeoff? aircraft, weather
    raise 'Cannot locate the aircraft' unless @dock.include? aircraft
    raise 'Weather not ideal' if weather.stormy
  end

  def full
    @dock.count >= @capacity
  end
end
