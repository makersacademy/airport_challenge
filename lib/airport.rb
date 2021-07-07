require_relative 'plane'
require_relative 'wrong_state_error'
require_relative 'wrong_airport_error'
require_relative 'airport_full_error'
require_relative 'weather'
require_relative 'bad_weather_error'

class Airport
  attr_reader :planes

  def initialize(capacity = 2)
    @planes = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land_plane(plane)
    raise WrongStateError, 'this plane is not flying' if plane.state == :landed
    raise AirportFullError, 'this airport is full' if @planes.count >= @capacity

    @planes << plane
    plane.change_state(:landed)
  end

  def take_off(plane)
    ok = @weather.check
    raise BadWeatherError, "it's too stormy to fly" if ok == :stormy
    raise WrongStateError, 'this plane is already flying' if plane.state == :flying
    raise WrongAirportError, 'that plane is not at this airport' unless @planes.include?(plane)

    @planes -= [plane]
    plane.change_state(:flying)
  end
end
