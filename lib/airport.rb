require_relative 'aircraft'
require_relative 'weather'

class Airport
  attr_reader :capacity, :aircrafts
  DEFAULT_CAPACITY = 5

  def initialize capacity=DEFAULT_CAPACITY
    @capacity = capacity
    @aircrafts = []
  end

  def land aircraft, weather=Weather.new
    raise 'The aircraft is on the ground' if aircraft.landed == true
    raise 'The airport is full' if full
    raise 'Weather not ideal.' if weather.stormy
    aircraft.change_status
    @aircrafts << aircraft
    "The #{aircraft} has landed safely to #{self}"
  end

  def takeoff aircraft, weather=Weather.new
    raise 'Cannot locate the aircraft' unless @aircrafts.include? aircraft
    raise 'Weather not ideal' if weather.stormy
    aircraft.change_status
    @aircrafts.delete aircraft
    "The #{aircraft} has successfully taken off from #{self}"
    end

  private
  def empty
    @aircrafts == []
  end

  def full
    @aircrafts.count >= @capacity
  end
end
