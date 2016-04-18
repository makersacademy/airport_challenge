require_relative 'aircraft'
require_relative 'weather'

class Airport
  attr_reader :capacity
  DEFAULT_CAPACITY = 5

  def initialize capacity=DEFAULT_CAPACITY, weather=Weather.new
    @capacity = capacity
    @dock = []
    @weather = weather
  end

  def land aircraft, weather=@weather
    can_land aircraft, weather
    aircraft.change_status
    dock aircraft
    'The aircraft has landed safely to the airport'
  end

  def takeoff aircraft, weather=@weather
    can_takeoff aircraft, weather
    aircraft.change_status
    de_dock aircraft
    'The aircraft has successfully taken off from the airport'
  end

  def show_dock
    @dock.clone.freeze
  end

  def show_weather
    @weather.clone.freeze
  end

  private

  def can_land aircraft, weather
    raise 'The aircraft is already on the ground' if aircraft.landed
    raise 'Unable to instruct landing as the airport dock is full' if full
    raise 'Unable to instruct landing due to severe weather' if weather.stormy?
  end

  def can_takeoff aircraft, weather
    raise 'Unable to locate the aircraft' unless @dock.include? aircraft
    raise 'Unable to instruct landing due to severe weather' if weather.stormy?
  end

  def full
    @dock.count >= @capacity
  end

  def dock plane
    @dock << plane
  end

  def de_dock plane
    @dock.delete plane
  end
end
