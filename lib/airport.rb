require_relative '../lib/plane.rb'
require_relative '../lib/weather.rb'

class Airport
  attr_reader :hangar, :capacity
  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @hangar = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    land_checks(plane)
    @hangar << plane
  end

  def take_off(plane)
    take_off_checks(plane)
    @hangar.delete(plane)
  end

  private

  def land_checks(plane)
    fail 'Hangar full.' if @hangar.count >= @capacity
    fail 'Plane already grounded.' if @hangar.include? plane
    fail 'Weather stormy, landing not available.' if storm? == true
  end

  def take_off_checks(plane)
    fail 'No planes in hangar.' if @hangar.count == 0
    fail 'Plane not in hangar.' if !@hangar.include? plane
    fail 'Weather stormy, take off not available.' if storm? == true
  end

  def storm?
    @weather.storm?
  end
end
