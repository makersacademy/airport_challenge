require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @planes = []
    @weather = Weather.new
  end

  def land(plane)
    clear_for_landing(plane)
    plane.end_flying
    planes << plane
  end

  def take_off(plane)
    clear_for_take_off(plane)
    plane.start_flying
    planes.delete(plane)
  end

  def new_capacity(capacity)
    @capacity = capacity
  end

  def plane_count
    planes.count
  end

  private
  attr_reader :planes, :weather
  DEFAULT_CAPACITY = 20
  ERROR = { :stormy => "All flights cancelled due to stormy weather",
            :full => 'Airport is full',
            :already_in_airport => 'Plane is already in airport',
            :not_in_airport => 'Plane not in airport' }.freeze

  def clear_for_landing(plane)
    raise ERROR[:stormy] if weather.stormy?
    raise ERROR[:already_in_airport] if planes.include?(plane)
    raise ERROR[:full] if full?
  end

  def clear_for_take_off(plane)
    raise ERROR[:stormy] if weather.stormy?
    raise ERROR[:not_in_airport] unless planes.include?(plane)
  end

  def full?
    plane_count == capacity
  end

end
