require_relative 'plane'
require_relative 'weather_module'

class Airport
  include Weather

  DEFAULT_CAPACITY = 20
  attr_reader :capacity, :parked_planes, :weather_condition

  def initialize(capacity=DEFAULT_CAPACITY)
    @weather_condition = set_weather
    @capacity = capacity
    @parked_planes = []
  end

  def full?
    @parked_planes.count == capacity
  end

  def land(planes)
    raise 'Airport is full' if full?
    raise 'Unable to land due to storm' if @weather_condition == :stormy
    spaces = (capacity - @parked_planes.count)
    if planes.count > spaces
      @parked_planes = [@parked_planes, planes.first(spaces)].flatten
      puts "Couldn\'t fit all planes, landed the first #{spaces}: #{@parked_planes.first(spaces)}"
    else
      @parked_planes = [@parked_planes, planes].flatten
    end
  end

  def take_off(planes)
    raise 'No planes in airport' if @parked_planes.empty?
    raise 'Unable to take off due to storm' if @weather_condition == :stormy
    flight_nos = planes.map { |p| p.flight_no }
    @parked_planes.delete_if { |p| flight_nos.include?(p.flight_no) }
  end
end

