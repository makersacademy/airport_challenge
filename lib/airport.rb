require_relative 'plane'
require_relative 'weather'

class Airport

  include Weather

  attr_reader :planes, :weather
  attr_accessor :capacity, :airport_name
  DEFAULT_CAPACITY = 20
  ERROR = { :stormy => "All flights cancelled due to stormy weather",
            :full => 'Airport is full',
            :already_in_airport => 'Plane is already in airport',
            :not_in_airport => 'Plane not in airport',
            :landing => 'Problem with landing',
            :take_off => 'Problem with take off' }.freeze

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
  end

  def land(plane)
    clear_for_landing(plane)
    plane.end_flying
    raise ERROR[:landing] if plane.flying?
    planes << plane
  end

  def take_off(plane)
    clear_for_take_off(plane)
    plane.start_flying
    raise ERROR[:take_off] unless plane.flying?
    planes.delete(plane)
  end

  def plane_count
    planes.count
  end

  private

  def clear_for_landing(plane)
    check_weather
    raise ERROR[:already_in_airport] if planes.include?(plane)
    raise ERROR[:full] if full?
  end

  def clear_for_take_off(plane)
    check_weather
    raise ERROR[:not_in_airport] unless planes.include?(plane)
  end

  def check_weather
    raise ERROR[:stormy] if stormy?
  end

  def full?
    plane_count == capacity
  end

end
