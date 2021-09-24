require_relative '../errors/airport_full_error'
require_relative '../errors/bad_weather_error'
require_relative '../errors/not_a_plane_error'
require_relative '../errors/plane_already_landed_error'
require_relative '../errors/plane_not_at_airport_error'
class Airport

  DEFAULT_CAPACITY = 20

  def initialize(airport_name, id, code, weather_service, capacity = DEFAULT_CAPACITY)
    @airport_name = airport_name
    @id = id
    @code = code
    @weather_service = weather_service
    @capacity = capacity
    @planes_at_terminal = []
  end

  attr_reader :id, :airport_name, :code, :capacity

  def land_plane(plane)
    raise NotAPlaneError.new(plane) if not_a_plane?(plane)
    begin
      check_landing_conditions(plane)
      @planes_at_terminal << plane
      plane.update_status(code)
      :ok
    rescue => error
      "cannot land #{error.effected_plane.id}: #{error.message}"
    end 
  end

  def take_off(plane)
    raise NotAPlaneError.new(plane) if not_a_plane?(plane)
    begin
      pre_flight_checks(plane)
      @planes_at_terminal.delete(plane)
      plane.update_status(Aeroplane::FLYING)
      :ok
    rescue => error
      "#{error.effected_plane.id} cannot take-off: #{error.message}"
    end 
  end

  def view_planes_at_terminal
    @planes_at_terminal.map { |plane| plane.id }
  end

  private

  def check_landing_conditions(plane)
    raise PlaneAlreadyLandedError.new(plane) unless plane_is_not_present?(plane)
    raise AirportFullError.new(plane) if airport_is_full?
    raise BadWeatherError.new(plane) if bad_weather?
  end

  def pre_flight_checks(plane)
    raise BadWeatherError.new(plane) if bad_weather?
    raise PlaneNotAtAirportError.new(plane) if plane_is_not_present?(plane)
  end

  def find_plane(plane_to_check)
    @planes_at_terminal.select { |stored_plane| stored_plane.id == plane_to_check.id }
  end
  
  def plane_is_not_present?(plane)
    find_plane(plane).empty?
  end

  def not_a_plane?(plane)
    plane.class != Aeroplane
  end

  def current_plane_count
    @planes_at_terminal.size
  end

  def airport_is_full?
    current_plane_count == @capacity
  end

  def bad_weather?
    @weather_service.weather_report == :storm
  end

end
