require_relative 'plane'

class Airport
  DEFAULT_CAPACITY = 20

  attr_reader :capacity, :parked_planes

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather_condition = :sunny
    @capacity = capacity
    @parked_planes = []
  end

  def set_weather
    (0..2).include?(rand(10)) ? :stormy : :sunny 
  end

  def full?
    @parked_planes.count == capacity
  end

  def land(planes)
    raise 'Airport is full' if full?
    raise 'Unable to land due to storm' if @weather_condition == :stormy
    @parked_planes << planes
  end

  def take_off(planes)
    raise 'No planes in airport' if @parked_planes.empty?
    raise 'Unable to take off due to storm' if @weather_condition == :stormy
    flight_nos = planes.map { |p| p.flight_no }
    @parked_planes.delete_if { |p| flight_nos.include?(p.flight_no) }
  end
end
